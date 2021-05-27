#!/bin/bash
filePath=/Users/johndoe/.screen-settings/screen.conf
source $filePath

# Script requires ddcctl https://github.com/kfix/ddcctl
# To set up launchd run
# sudo cp com.<org>.settings.screen.plist /Library/LaunchAgents
# sudo launchctl load -w /Library/LaunchAgents/com.<org>.settings.screen.plist
# sudo launchctl load -w /Library/LaunchAgents/com.<org>.settings.screen.plist


# Check is already being performed and needs to complete
if [ $CHECKING = true ]; then
    exit
else
    sed -i '' 's/CHECKING\=.*/CHECKING\=true/' $filePath
fi

# Check if monitor is attached
monitor_attached=$( system_profiler SPDisplaysDataType | grep -c 'BenQ GW2780' )

if [ $monitor_attached -eq 0 ]; then
    sed -i '' 's/CHECKING\=.*/CHECKING\=bruce/' $filePath
    sed -i '' 's/ACTIVE\=.*/ACTIVE\=true/' $filePath
    exit
fi

# Check to see if ergodox keyboard is attached
keyboard_attached=$( ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*' | grep -c 'Ergodox EZ' )

# Check idle time
IDLE=$((`ioreg -c IOHIDSystem | sed -e '/HIDIdleTime/ !{ d' -e 't' -e '}' -e 's/.* = //g' -e 'q'` / 1000000000))

# If set to active, but ergodox not attached, and screen has been idle for more than 1 second
if [[ $ACTIVE = true && $keyboard_attached -eq 0 && $IDLE -gt 1 ]]; then
    /usr/local/bin/ddcctl -d 1 -i 1;
    sed -i '' 's/ACTIVE\=.*/ACTIVE\=false/' $filePath
elif [[ $ACTIVE = false && $keyboard_attached -eq 1 ]]; then
    /usr/local/bin/ddcctl -d 1 -i 17;
    sed -i '' 's/ACTIVE\=.*/ACTIVE\=true/' $filePath
fi

sed -i '' 's/CHECKING\=.*/CHECKING\=false/' $filePath
