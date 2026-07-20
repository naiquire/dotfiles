#!/bin/bash

STATE_FILE="/tmp/wf-recorder-start"

if pgrep -x wf-recorder >/dev/null; then
    if [ -f "$STATE_FILE" ]; then
        start=$(cat "$STATE_FILE")
        now=$(date +%s)
        elapsed=$((now - start))

        mins=$((elapsed / 60))
        secs=$((elapsed % 60))

        printf " %02d:%02d\n" "$mins" "$secs"
    else
        echo ""
    fi
else
    echo ""
fi