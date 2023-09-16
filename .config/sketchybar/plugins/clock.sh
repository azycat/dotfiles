#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# sketchybar --set $NAME label="$(date '+%d/%m %H:%M')"
sketchybar --set $NAME icon="$(LANG=ja_JP date '+%B.%e日(%a) ')" label="$(date '+%H:%M')"