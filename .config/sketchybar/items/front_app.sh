#!/bin/bash

MEEP=$(echo $INFO | tr '[:upper:]' '[:lower:]') # this took me sooo long. til shell script is not bash.
FRONT_APP_SCRIPT='sketchybar --set $NAME label="${MEEP}"'

front_app=(
  icon.drawing=off
  label.font="$FONT:Black:12.0"
  associated_display=active
  script="$FRONT_APP_SCRIPT"
)

sketchybar --add item front_app left           \
           --set front_app "${front_app[@]}"   \
           --subscribe front_app front_app_switched
