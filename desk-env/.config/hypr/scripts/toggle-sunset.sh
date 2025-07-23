#!/usr/bin/bash

if pgrep hyprsunset; then
    killall -9 hyprsunset
else
    ~/.config/hypr/scripts/enable-sunset.sh
fi
