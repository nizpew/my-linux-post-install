#!/bin/bash

##virt-manager; sleep 2; xdotool mousemove 263 332; xdotool click 1; xdotool mousemove 200 200; xdotool click 1;xdotool mousemove 263 332; xdotool click 1; xdotool mousemove 263 201; xdotool click 1; xdotool mousemove 902 140; sleep 2;xdotool click 1; click 1; xdotool mousemove 276 167; xdotool click 1; xdotool mousemove 272 280; xdotool click 1;

picom &

weektodo & 
/usr/bin/gnome-terminal --profile=cava ; sleep 2 &
/usr/bin/gnome-terminal --profile=neofet ; sleep 2 &
/usr/bin/gnome-terminal --profile=top ; sleep 2 &



##$(/usr/bin/gnome-terminal --profile=top && /usr/bin/gnome-terminal --profile=cava) &

##feh --bg-fill Downloads/photos/&

chromium &
sleep 1
hyprctl dispatch workspace 2 &

sleep 2
hyprctl dispatch workspace 3 &
weektodo &



