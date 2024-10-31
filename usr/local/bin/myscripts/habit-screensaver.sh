#!/bin/bash

# URL to open

# Path to save the screenshot
OUTPUT_PATH="$HOME/Documents/screensaver-pic/1.png"

# Open Chromium in the background with the specified URL
chromium --no-sandbox --disable-gpu --force-device-scale-factor=0.5 --new-window "https://app.everyday.app/" &

# Wait for the browser to open and load the page
sleep 6  # Adjust this as necessary based on your page load time
xdotool mousemove 1906 146


xdotool click 1
xdotool mousemove 1073 125 
sleep 1
xdotool click 1
sleep 6
# Get the window ID of Chromium (most recent window)
WINDOW_ID=$(xdotool search --onlyvisible --class chromium | head -n 1)

# Take a screenshot of the Chromium window
import -window "$WINDOW_ID" "$OUTPUT_PATH"

# Optionally, you can close Chromium if you don't need it open
xdotool windowclose "$WINDOW_ID"

echo "Screenshot saved to $OUTPUT_PATH"

