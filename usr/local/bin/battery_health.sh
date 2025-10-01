#!/bin/bash

# Get battery information
BATTERY_PATH=$(upower -e | grep 'BAT')
if [ -z "$BATTERY_PATH" ]; then
    echo "No battery found."
    exit 1
fi

# Get battery details
BATTERY_INFO=$(upower -i "$BATTERY_PATH")

# Extract relevant information
ENERGY_FULL=$(echo "$BATTERY_INFO" | grep "energy-full:" | awk '{print $2}')
ENERGY_FULL_DESIGN=$(echo "$BATTERY_INFO" | grep "energy-full-design:" | awk '{print $2}')
PERCENTAGE=$(echo "$BATTERY_INFO" | grep "percentage:" | awk '{print $2}')
CAPACITY=$(echo "$BATTERY_INFO" | grep "capacity:" | awk '{print $2}')

# Calculate health percentage
if [[ -n "$ENERGY_FULL" && -n "$ENERGY_FULL_DESIGN" ]]; then
    HEALTH=$(echo "scale=2; ($ENERGY_FULL / $ENERGY_FULL_DESIGN) * 100" | bc)
else
    HEALTH="N/A"
fi

# Display results
echo "Calculated Health Percentage: $HEALTH%"

# Check if health is below a certain threshold
if (( $(echo "$HEALTH < 80" | bc -l) )); then
    echo "Warning: Battery health is below 80%. Consider replacing the battery."
else
    echo "Battery health is acceptable."
fi

