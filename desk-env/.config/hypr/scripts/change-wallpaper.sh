#!/usr/bin/sh

if [ $# != 1 ]; then
    exit 1
elif [ ! -f $1 ]; then
    exit 1
fi

selectedFile=~/.cache/selected-wallpaper

cp $1 $selectedFile --update=all

~/.config/hypr/scripts/reload.sh
