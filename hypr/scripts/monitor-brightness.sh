#!/bin/bash

# get current brightness and requested change
DELTA=$1
STATE=$(ddccontrol -r 0x10 dev:/dev/i2c-1 | grep -oP '(?<=\+/)\d+(?=/)')

# exit if brightness at a limit
if { [ "$DELTA" -lt 0 ] && [ "$STATE" -eq 0 ]; } ||
   { [ "$DELTA" -gt 0 ] && [ "$STATE" -eq 100 ]; }; then
    exit
fi

ddccontrol -r 0x10 -W $DELTA dev:/dev/i2c-1
STATE=$(ddccontrol -r 0x10 dev:/dev/i2c-1 | grep -oP '(?<=\+/)\d+(?=/)')
notify-send -u low -t 1000 "Monitor brightness set to $STATE"
