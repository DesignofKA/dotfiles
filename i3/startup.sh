#!/usr/bin/env sh
killall polybar
killall compton
(sleep 2; compton) &
(sleep 2; polybar top -r) &
