#!/usr/bin/env sh

# Kill all start up processes
killall polybar
killall compton

# Start up processes
(sleep 2; compton) &
(sleep 2; polybar top -r) &

# Start up programs
