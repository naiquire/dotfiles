#!/bin/bash

ACTIVE=$(hyprctl getoption decoration:active_opacity -j | jq -r .float)
INACTIVE=$(hyprctl getoption decoration:inactive_opacity -j | jq -r .float)

cleanup() {
    hyprctl --batch \
      "keyword decoration:active_opacity $ACTIVE;
       keyword decoration:inactive_opacity $INACTIVE"
}

trap cleanup EXIT

hyprctl --batch \
  "keyword decoration:active_opacity 1.0;
   keyword decoration:inactive_opacity 1.0"

if [ "$1" = "save" ]; then
    hyprshot -m region -o "$HOME/Downloads"
else
    hyprshot -m region -s --clipboard-only
fi
