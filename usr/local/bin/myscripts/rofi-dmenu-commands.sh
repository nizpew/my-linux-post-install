#!/bin/bash

# Define the list of commands
COMMANDS="
: 'pomodoro                                                                                      ';/usr/bin/gnome-pomodoro
: 'cryptobook                                                                                      ';/usr/bin/xournalpp ./Documents/books/Crime\ and\ Punishment\ -\ Fyodor\ Dostoyevsky\ -\ PDF.pdf
: 'light down                                                                                      ';/usr/local/bin/brightnessctl low
: 'light up                                                                                      ';/usr/local/bin/brightnessctl high
: 'redshiftshort -up                                                                                      ';/usr/local/bin/redshiftshort -up
: 'redshiftshort -down                                                                                      ';/usr/local/bin/redshiftshort -down
:'sound volume control                                                                 ';pavucontrol
: 'teologyshort                                                                                      ';kitty teologyshort -rr
: 'journalingshort                                                                                      ';kitty journalingshort
: 'timer 5                                                                                      ';/usr/local/bin/timer 5
: 'timer 25                                                                                      ';/usr/local/bin/timer 25
: 'more apps                                                                                      ';/usr/bin/rofi -show drun
: 'kill timers                                                                                      ';/usr/local/bin/myscripts/kill-timers
: 'change rofi menu                                                                               ';kitty /usr/local/bin/myscripts/change-rofi-menu
: 'change wallpaper                                                                                ';feh --bg-fill ./Downloads/wpp/$(ls ./Downloads/wpp/ | shuf | sed -n '4p')
"

# Use rofi to select a command
SELECTED_COMMAND=$(echo "$COMMANDS" | rofi -dmenu -i -p "Select command:")

# Check if a command was selected
if [ -n "$SELECTED_COMMAND" ]; then
    # Execute the selected command
    eval "$SELECTED_COMMAND"
fi





#
#
#: 'awakes openvpn                                                                                                               ';kitty sudo openvpn --dev tun0 --user troll --config /etc/openvpn/server.conf; sleep 5
#: 'see if openvpn is running                                                                        ';/usr/local/bin/myscripts/ifopenvpnison
#
#
#
#
#
#
#
#
#
#
