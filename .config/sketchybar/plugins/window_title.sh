#!/bin/bash

# W I N D O W  T I T L E 
WINDOW_TITLE=$(/usr/local/bin/yabai -m query --windows --window | jq -r '.title')

if [[ $WINDOW_TITLE = "" ]]; then
  WINDOW_TITLE=$(/usr/local/bin/yabai -m query --windows --window | jq -r '.app')
fi

if [[ ${#WINDOW_TITLE} -gt 50 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)
  sketchybar -m --set title label="│ $WINDOW_TITLE"…
  exit 0
fi

MURP=$(echo $WINDOW_TITLE | tr "[:upper:]" "[:lower:]")

echo MURP

sketchybar -m --set title label="│ $MURP"