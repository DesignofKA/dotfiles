#!/usr/bin/env sh
killall polybar
killall compton
killall blueman-applet
(sleep 2; compton) &
(sleep 2; polybar top -r) &
(sleep 2; blueman-applet) &
