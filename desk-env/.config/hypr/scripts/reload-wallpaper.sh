#!/usr/bin/sh

if [ ! -d ~/.cache/desktop ]; then
    mkdir ~/.cache/desktop
fi

selectedFile=~/.cache/desktop/selected-wallpaper

hyprctl hyprpaper reload ,"$selectedFile"

wal -i $selectedFile --cols16 -n
