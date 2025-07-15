#!/usr/bin/sh

if [ $# != 1 ] || [[ $1 != @("play-pause"|"play"|"pause"|"next"|"previous") ]] then
    exit 1
fi

activePlayer=$(playerctl -l | head -n1)

while IFS= read -r playerID; do
    status=$(playerctl -p "$playerID" status 2>/dev/null)
    if [[ "$status" == "Playing" ]]; then
        activePlayer="$playerID"
        break
    fi
done < <(playerctl -l)

if [[ -z $activePlayer ]]; then
    exit 0
fi

case $1 in
    "play-pause")
        playerctl -p "$activePlayer" play-pause
        ;;
    "play")
        playerctl -p "$activePlayer" play
        ;;
    "pause")
        playerctl -p "$activePlayer" pause
        ;;
    "next")
        playerctl -p "$activePlayer" next
        ;;
    "previous")
        playerctl -p "$activePlayer" previous
        ;;
esac
