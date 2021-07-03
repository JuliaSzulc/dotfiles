#!/bin/sh

DEFAULT_SOURCE_INDEX=$(pacmd list-sources | grep "\* index:" | cut -d' ' -f5)

case $1 in
	"display")
		mute=$(pacmd list-sources | grep "index: $DEFAULT_SOURCE_INDEX" -A 11 | grep "muted")
        if [[ "$mute" == *"yes"* ]]; then
            echo ""
        elif [[ "$mute" == *"no"* ]]; then
            echo ""
        else
            echo ""
        fi
        ;;
	"toggle")
		pactl set-source-mute $DEFAULT_SOURCE_INDEX toggle
        ;;
    *)
		echo "Invalid script option"
		;;
esac
