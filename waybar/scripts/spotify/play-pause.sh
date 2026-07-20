#!/bin/bash

# default value
echo "{\"text\": \"󰐊\"}"
# follow status of spotify media to ensure live updates to play button
playerctl --player=spotify status --follow | while read state; do
    if [ "$state" == "Playing" ]; then
        icon="󰏤"
    else
        icon="󰐊"
    fi

    echo "{\"text\": \"$icon\"}"
done