#!/usr/bin/env bash
# ~/.config/bspwm/launch.sh

# Terminate already running bar instances
killall -q polybar
killall -q xss-lock
#pkill -USR1 redshift

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -q -c ~/.config/polybar/config hlwm &
#redshift -c ~/.config/redshift.conf &
xss-lock -- ./$hsdir/lock_screen.sh -n

#notify-send "welcome to herbstluftwm" &

