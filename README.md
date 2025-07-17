# Dotfiles
These are my dotfiles. Utilizing stow to manage them.

## Install Dependecies
To install the dotfiles, you will need git, git-lfs, and stow. All are available via pacman.

## Installing the Dotfiles
Packages can be installed with `stow <package name>`.

## The Packages

### Desk-env
Desktop environment using Hyprland. It requires waybar, rofi, playerctl, pamixer, and hyprpaper, hyprpicker, wl-clipboard, wl-clip-persist, and hyprsunset. The default apps are kitty, firefox, and dolphin. You have theme management managed by pywal16.

### Shell
Various command line items

 - Kitty. The terminal emulator.
 - Neovim using the Lazy plugin manager. It requires rust (for tree-sitter).
 - Zoxide.
 - Fzf. Your fuzzy finder.
