#!/bin/sh

xrdb_color () { xrdb -query | grep "*.$1:" | cut -f 2; }


B='#00000000'  # blank
C='#ffffff22'  # clear ish
D=$(xrdb_color foreground)  # default
T=$(xrdb_color foreground)  # text
W=$(xrdb_color color8)  # wrong
V=$T  # verifying

i3lock \
--insidever-color=$C   \
--ringver-color=$V     \
\
--insidewrong-color=$C \
--ringwrong-color=$W   \
\
--inside-color=$B      \
--ring-color=$D        \
--line-color=$B        \
--separator-color=$D   \
\
--verif-color=$V        \
--wrong-color=$W        \
--time-color=$T        \
--date-color=$T        \
--layout-color=$T      \
--keyhl-color=$W      \
--bshl-color=$W        \
 \
--screen 1            \
--blur 5              \
--image ~/Pictures/wallpapers/plants1.png \
--clock               \
--indicator           \
--time-str="%H:%M"  \
--date-str="%a, %d/%m/%Y" \
--ignore-empty-password \
