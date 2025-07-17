#!/bin/bash

if pgrep hyprsunset; then
    killall hyprsunset
else
    hyprsunset -t 2500
fi
