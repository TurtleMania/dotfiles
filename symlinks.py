#!/usr/bin/env python3

import argparse
from pathlib import Path
import os

# Utility functions
def get_script_dir() -> Path:
    return Path(os.path.dirname(os.path.realpath(__file__)))

def get_data_dir() -> Path:
    xdg_data_dir = os.getenv("XDG_DATA_HOME")
    if xdg_data_dir is not None:
        return Path(xdg_data_dir)
    home = os.getenv("HOME")
    if home is not None:
        return Path(home) / ".local" / "share"
    return get_script_dir() / ".local" / "share"

def get_app_data_dir() -> Path:
    p = get_data_dir() / "desk-env"
    p.mkdir(parents=True, exist_ok=True)
    return p

def get_linked_index() -> set[Path]:
    links = set()
    try:
        with (get_app_data_dir() / "symlinks.txt").open(mode='r') as f:
            data = f.read()
        for line in data.splitlines():
            if line != "":
                links.add(Path(line)) 
    except FileNotFoundError:
        pass
    return links

def write_linked_list(items: set[Path]):
    with (get_app_data_dir() / "symlinks.txt").open(mode='w') as f:
        f.write('\n'.join([str(x) for x in items]) + '\n')

def generate_links() -> set[Path]:
    paths = set()
    base_config_path = get_script_dir() / "config"
    home_path = Path.home()
    for path in base_config_path.rglob("*"):
        if path.is_dir():
            continue
        # Ignore symlinks from config directory as these are uncommitable
        if path.is_symlink():
            continue
        config_path = path.resolve()
        relative_path = config_path.relative_to(base_config_path)
        if (home_path / relative_path).is_relative_to(base_config_path):
            continue
        if (home_path / relative_path).is_symlink():
            paths.add(relative_path)
            continue
        for path in reversed([relative_path] + list(relative_path.parents)):
            if (home_path / path).is_symlink():
                paths.add(path)
                break
            if (home_path / path).is_dir():
                continue
            paths.add(path)
            break
    return paths 

# Begin command functions
def sync_links(_args):
    del _args
    current_links = generate_links()
    old_links = get_linked_index()
    #print(current_links)
    #print(old_links)
    #return
    home_path = Path.home()
    config_path = get_script_dir() / "config"
    links = old_links
    for link in old_links - current_links:
        try:
            (home_path / link).unlink()
            links.remove(link)
        except Exception as e:
            write_linked_list(links)
            raise e
    for link in current_links - old_links:
        try:
            (home_path / link).symlink_to(config_path / link)
            links.add(link)
        except Exception as e:
            write_linked_list(links)
            raise e
    write_linked_list(links)

def remove_links(_args):
    del _args
    current_links = get_linked_index()
    home_path = Path.home()
    links = set(current_links)
    for link in current_links:
        try:
            (home_path / link).unlink()
            links.remove(link)
        except Exception as e:
            write_linked_list(links)
            raise e
    write_linked_list(links)

def list_links(_args):
    del _args
    home_path = Path.home()
    links = list(get_linked_index())
    links.sort()
    print('\n'.join([str(home_path / x) for x in links]))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(required=True)

    add_parser = subparsers.add_parser("sync",
        help="Create and remove symlinks to match packages.")
    add_parser.set_defaults(func=sync_links)

    list_parser = subparsers.add_parser("list",
        help="List the linked files.")
    list_parser.set_defaults(func=list_links)

    remove_parser = subparsers.add_parser("remove",
        help="Remove symlinks.")
    remove_parser.set_defaults(func=remove_links)

    args = parser.parse_args()
    args.func(args)
