#!/usr/bin/bash

if pgrep hyprsunset; then
    killall -9 hyprsunset
else
    hyprsunset -t 2500
fi
