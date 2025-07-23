#!/usr/bin/sh

cd ~/wallpapers
selected=$(fzf --preview='kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {}')

nohup ~/.config/hypr/scripts/change-wallpaper.sh $selected &> /dev/null
