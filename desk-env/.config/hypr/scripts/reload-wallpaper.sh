#!/usr/bin/sh

selectedFile=~/.cache/selected-wallpaper

hyprctl hyprpaper reload ,"$selectedFile"

wal -i $selectedFile --cols16 -n
