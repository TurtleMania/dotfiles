#!/usr/bin/sh

selectedFile=~/.config/hypr/selected-wallpaper

hyprctl hyprpaper reload ,"$selectedFile"

wal -i $selectedFile --cols16 -n
