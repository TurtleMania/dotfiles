#!/usr/bin/sh

if [ ! -d ~/.cache/desktop ]; then
    mkdir ~/.cache/desktop
fi

if [ ! -f ~/.cache/desktop/temperature.txt ]; then
    echo "2500" > ~/.cache/desktop/temperature.txt
fi

temperature=$(<~/.cache/desktop/temperature.txt)

nohup hyprsunset -t "$temperature" &> /dev/null &
