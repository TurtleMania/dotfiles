#!/usr/bin/sh

if pgrep -x "waybar"; then
    killall waybar
else
    waybar
fi
