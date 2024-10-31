#!/bin/bash

# Get battery status
status=$(cat /sys/class/power_supply/BAT0/status)

# Get battery percentage
percentage=$(cat /sys/class/power_supply/BAT0/capacity)

# Check if charging
if [ "$status" = "Charging" ]; then
    echo "CHR $percentage%"
else
    echo "BAT $percentage%"
fi

