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
    try:
        with (get_app_data_dir() / "symlinks.txt").open(mode='r') as f:
            data = f.read()
        return set([Path(x) for x in data.splitlines()])
    except FileNotFoundError:
        return set()

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
        config_path = path.resolve()
        relative_path = config_path.relative_to(base_config_path)
        if (home_path / relative_path).is_relative_to(base_config_path):
            continue
        working_path = None
        for path in relative_path.parents:
            end_path = home_path / path
            if not (end_path.is_dir() or end_path.is_file()):
                working_path = path
                continue
            if working_path is None:
                paths.add(relative_path)
            else:
                paths.add(working_path)
            break
    return paths 

# Begin command functions
def sync_links(_args):
    del _args
    current_links = generate_links()
    old_links = get_linked_index()
    home_path = Path.home()
    config_path = get_script_dir() / "config"
    for link in old_links - current_links:
        (home_path / link).unlink()
    for link in current_links - old_links:
        (home_path / link).symlink_to(config_path / link)
    write_linked_list(current_links)

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

    args = parser.parse_args()
    args.func(args)
