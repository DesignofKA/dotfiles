#!/usr/bin/env sh

# Kill all start up processes
killall polybar
killall compton
killall dunst

# Start up processes
(sleep 2; compton) &
(sleep 2; polybar top -r) &
(sleep 2; dunst) &

# Start up programs
