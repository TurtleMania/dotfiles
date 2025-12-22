TODO: packages.py and symlinks.py scripts.
# Dotfiles
These are my personal dotfiles. Don't bring opinions here.

## Installation
Use the [packages.py](packages.py) (`./packages.py update` to install) script to manage dependencies and the
[symlinks.py](symlinks.py) (`./symlinks.py sync` to create) script to create and manage symlinks.

## Usage
### [packages.py](packages.py)
Commands: 
  add <package>: Add a package to the index.
  remove <package>: Remove a package from the index.
  update: Update the system packages to match the index.
  list: List the packages in the index.
  query: Query system packages installed by this script.

### [symlinks.py](symlink.py)
Commands:
  sync: Create and remove symlinks to match packages.
  list: List the config files add.
  query: Query config files installed by this script.
