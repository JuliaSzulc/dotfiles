#!/bin/bash

JBL_CONNECTED="c"  #"%{F#0000ff}%{F-}"
JBL_DISCONNECTED="d" #"%{F#ff0000}%{F-}"
WAIT=""

JBL_MAC="78:44:05:53:8A:36"

printf "abc\r"
sleep 2

case "$1" in
    check)
        if bluetoothctl info | grep -q $JBL_MAC; then
             printf "$JBL_CONNECTED"
        else
             printf "$JBL_DISCONNECTED"
        fi
        ;;

    toggle)
        if bluetoothctl info | grep -q $JBL_MAC; then
            bluetoothctl power off >> /dev/null
            printf "$JBL_DISCONNECTED"
        else
            bluetoothctl power on >> /dev/null
            for i in {1..5}; do
                if bluetoothctl connect $JBL_MAC | grep -q "Connection successful"; then
                    printf "$JBL_CONNECTED"
                    exit 1
                fi
            done
            printf "$JBL_DISCONNECTED"
        fi
esac

