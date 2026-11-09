#!/bin/bash

# cache current window opacity
ACTIVE=$(hyprctl getoption decoration:active_opacity -j | jq -r .float)
INACTIVE=$(hyprctl getoption decoration:inactive_opacity -j | jq -r .float)

cleanup() {
    # restore opacity
    hyprctl eval "hl.config({ ['decoration.active_opacity'] = $ACTIVE, ['decoration.inactive_opacity'] = $INACTIVE })"
}

trap cleanup EXIT

# set opacity of windows to 1.0
hyprctl eval "hl.config({ ['decoration.active_opacity'] = 1.0, ['decoration.inactive_opacity'] = 1.0 })"

# screenshot
if [ "$1" = "save" ]; then
    hyprshot -m region -o "$HOME/Downloads"
else
    hyprshot -m region -s --clipboard-only
fi

