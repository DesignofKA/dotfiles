#!/usr/bin/env sh

# Kill all start up processes
killall polybar
killall compton
killall blueman-applet

# Start up processes
(sleep 2; compton) &
(sleep 2; polybar top -r) &
(sleep 2; blueman-applet) &

# Start up programs
