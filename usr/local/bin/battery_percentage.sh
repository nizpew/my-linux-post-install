#!/bin/bash
#!/bin/bash


while true; do
    percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'percentage:' | awk '{print $2}')
        notify-send "Battery Percentage" "$percentage"
    
    sleep 10.3  # Update interval in seconds (adjust as needed)
done

