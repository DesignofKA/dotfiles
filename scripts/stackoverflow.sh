#! /bin/bash
# PATH=$PATH:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
POINTS="$(/usr/bin/http https://api.stackexchange.com/2.2/users/6449040\?order\=desc\&sort\=reputation\&site\=stackoverflow)"
# POINTS=$(echo ${POINTS} | /usr/bin/jq '.items[0].reputation')
POINTS=$(echo ${POINTS} | /usr/bin/jq '.items[0].reputation')
sudo -u kelvin DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Stack Overflow Reputation" $POINTS
