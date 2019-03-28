#! /bin/sh
export DISPLAY=:0.0
POINTS=$(http https://api.stackexchange.com/2.2/users/6449040\?order\=desc\&sort\=reputation\&site\=stackoverflow | jq '.items[0].reputation')
su - $USER -c "/usr/bin/notify-send 'Stack Overflow Reputation' $POINTS"
