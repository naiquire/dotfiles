#!/bin/bash

TARGET="$1"

ACTIVE=$(hyprctl activeworkspace -j | jq -r '.name')

if [[ "$ACTIVE" == special:* ]]; then
    hyprctl dispatch togglespecialworkspace
fi

hyprctl dispatch workspace "$TARGET"
