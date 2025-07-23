#!/usr/bin/sh

if [ ! -d ~/.cache/desktop ]; then
    mkdir ~/.cache/desktop
fi

re='^(100|[1-9]?[0-9])%$'
temperaturePercent=''

while [[ ! $temperaturePercent =~ $re ]]; do
    echo -n "> "
    read -r temperaturePercent
done

temperaturePercentNum=${temperaturePercent::-1}

temperature=$(( 1000 + (temperaturePercentNum*5000)/100 ))

echo $temperature > ~/.cache/desktop/temperature.txt
