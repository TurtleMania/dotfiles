#!/usr/bin/sh

if [ $# != 1 ] || [[ $1 != @("play-pause"|"play"|"pause"|"next"|"previous") ]] then
    exit 1
fi

priorityPlayers=()
while IFS= read -r player; do
    priorityPlayers+=("$player")
done < ~/.config/hypr/priority-players.txt

activePlayer=""
foundPlaying=false

while IFS= read -r playerID; do
    playing=false
    priority=false

    status=$(playerctl -p "$playerID" status 2>/dev/null)
    if [[ "$status" == "Playing" ]]; then
        playing=true
    fi
    for player in "${priorityPlayers[@]}"; do
        if [[ "$playerID" == *"$player"* ]]; then
            priority=true
        fi
    done

    case $1 in
        "play-pause")
            if [ "$foundPlaying" = true ]; then
                if [ "$playing" = false ]; then
                    continue
                fi

                if [ "$priority" = false ]; then
                    activePlayer="$playerID"
                    break
                fi
            else
                if [ "$playing" = true ]; then
                    activePlayer="$playerID"
                    if [ "$priority" = false ]; then
                        break
                    else
                        foundPlaying=true
                    fi
                    continue
                fi

                if [ "$priority" = false ]; then
                    activePlayer="$playerID"
                    continue
                fi
                if [[ -z "$activePlayer" ]]; then
                    activePlayer="$playerID"
                fi
            fi
            ;;
        "play")
            if [ "$playing" = true ]; then
                continue
            fi

            if [ "$priority" = true ]; then
                activePlayer="$playerID"
                break
            fi
            activePlayer="$playerID"
            ;;
        "pause"|"next"|"previous")
            if [ "$playing" = false ]; then
                continue
            fi

            if [ "$priority" = false ]; then
                activePlayer="$playerID"
                break
            fi

            activePlayer="$playerID"
            ;;
    esac

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
