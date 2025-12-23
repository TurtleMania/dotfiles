#!/usr/bin/env python3

import argparse
import subprocess
from pathlib import Path
import os

# Install/uninstall uses pacman, may change to yay or another AUR helper to
# support AUR packages.
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

def get_installed_list() -> set[str]:
    try:
        with (get_app_data_dir() / "installed_packages.txt").open(mode='r') as f:
            data = f.read()
        return set(data.splitlines())
    except FileNotFoundError:
        return set()

def write_installed_list(items: set[str] | list[str]):
    with (get_app_data_dir() / "installed_packages.txt").open(mode='w') as f:
        f.write('\n'.join(items) + '\n')

def get_package_list() -> set[str]:
    try:
        with (get_script_dir() / "packages.txt").open(mode='r') as f:
            data = f.read()
        return set(data.splitlines())
    except FileNotFoundError:
        return set()

def append_package_list(items: set[str]):
    with (get_script_dir() / "packages.txt").open(mode='a') as f:
        f.write('\n'.join(items) + '\n')

def write_package_list(items: set[str] | list[str]):
    with (get_script_dir() / "packages.txt").open(mode='w') as f:
        f.write('\n'.join(items) + '\n')

def install_packages(packages: set[str] | list[str]) -> bool:
    if len(packages) == 0:
        return True
    try:
        print("> sudo pacman -S --needed " + ' '.join(packages))
        subprocess.run(["sudo", "pacman", "-S", "--needed"] + list(packages), check=True)
        return True
    except subprocess.CalledProcessError:
        return False

def uninstall_packages(packages: set[str] | list[str]) -> bool:
    if len(packages) == 0:
        return True
    try:
        print("> sudo pacman -Runs --needed " + ' '.join(packages))
        subprocess.run(["sudo", "pacman", "-Runs"] + list(packages), check=True)
        return True
    except subprocess.CalledProcessError:
        return False

# Begin command functions
def add_package(args):
    append_package_list(args.packages)

def remove_package(args):
    write_package_list(get_package_list() - set(args.packages))

def update_package(_args):
    del _args
    package_list = get_package_list()
    installed_list = get_installed_list()
    if install_packages(package_list - installed_list) and uninstall_packages(installed_list - package_list):
        write_installed_list(package_list)

def list_package(_args):
    del _args
    print('\n'.join(sorted(get_package_list())))

def query_package(_args):
    del _args
    print('\n'.join(sorted(get_installed_list())))

def clean_package(_args):
    del _args
    write_package_list(sorted(get_package_list()))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(required=True)

    add_parser = subparsers.add_parser("add",
        help="Add a package to the index.")
    add_parser.add_argument("packages", help="The package to add.", nargs='+')
    add_parser.set_defaults(func=add_package)

    remove_parser = subparsers.add_parser("remove",
        help="Remove a package from the index.")
    remove_parser.add_argument("packages",
        help="The package to remove.", nargs='+')
    remove_parser.set_defaults(func=remove_package)

    update_parser = subparsers.add_parser("update",
        help="Update the system packages to match the index.")
    update_parser.set_defaults(func=update_package)

    list_parser = subparsers.add_parser("list",
        help="List the packages in the index.")
    list_parser.set_defaults(func=list_package)

    query_parser = subparsers.add_parser("query",
        help="Query packages installed by this script.")
    query_parser.set_defaults(func=query_package)

    clean_parser = subparsers.add_parser("clean",
        help="Clean and sort package index (Use this before commiting changes).")
    clean_parser.set_defaults(func=clean_package)

    args = parser.parse_args()
    args.func(args)
