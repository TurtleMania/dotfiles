#!/usr/bin/sh

killall hyprpaper
hyprpaper &

selectedFile=~/.config/hypr/selected-wallpaper

wal -i $selectedFile --cols16 -n
