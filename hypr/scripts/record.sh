#!/bin/bash

# track state for waybar updates
STATE_FILE="/home/naiquire/.config/hypr/.cache/wf-recorder"

# toggle wf-recorder
if pgrep -x wf-recorder >/dev/null; then
    pkill -INT wf-recorder
    rm -f "$STATE_FILE"
else
    date +%s > "$STATE_FILE"
    wf-recorder -r 60 --audio="$(pactl get-default-sink).monitor" --codec h264_nvenc -f "$HOME/Videos/$(date +"%y%m%d-%H%M").mp4"
fi

# refresh waybar
pkill -RTMIN+8 waybar
