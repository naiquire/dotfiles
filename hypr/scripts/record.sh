#!/bin/bash

# track state for waybar updates
STATE_FILE="/tmp/wf-recorder-start"

# toggle wf-recorder
if pgrep -x wf-recorder >/dev/null; then
    pkill -INT wf-recorder
    rm -f "$STATE_FILE"
else
    date +%s > "$STATE_FILE"
    wf-recorder -r 60 --audio --codec h264_nvenc -f "$HOME/Videos/$(date +"%H%M-%d%m%y").mp4"
fi

# refresh waybar
pkill -RTMIN+8 waybar
