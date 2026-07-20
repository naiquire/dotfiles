#!/bin/bash

# get current contrast and requested change
DELTA=$1
STATE=$(ddccontrol -r 0x12 dev:/dev/i2c-1 | grep -oP '(?<=\+/)\d+(?=/)')

# exit if contrast at a limit
if { [ "$DELTA" -lt 0 ] && [ "$STATE" -eq 0 ]; } ||
   { [ "$DELTA" -gt 0 ] && [ "$STATE" -eq 100 ]; }; then
    exit
fi

ddccontrol -r 0x12 -W $DELTA dev:/dev/i2c-1
STATE=$(ddccontrol -r 0x12 dev:/dev/i2c-1 | grep -oP '(?<=\+/)\d+(?=/)')
notify-send -u low -t 1000 "Monitor contrast set to $STATE"
