#!/usr/bin/sh

if pgrep -x "waybar"; then
    killall waybar
    waybar &
fi
