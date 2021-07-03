#!/bin/bash

CURRENT=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ')

TOP=3
BOT=0.1

new=$CURRENT

case $1 in
    -)
        if [[ $(echo "$CURRENT > $BOT" | bc) -eq 1 ]]; then
            new=$(echo "$CURRENT - 0.1" | bc)
        fi
        ;;
    
    +)
        if [[ $(echo "$CURRENT < $TOP" | bc) -eq 1 ]]; then
            new=$(echo "$CURRENT + 0.1" | bc)
        fi
        ;;

    0)
        new=1.0
        ;;
esac

xrandr --output eDP-1 --brightness $new

