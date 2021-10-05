#!/bin/bash

# Get monitor status
external_monitor=$(xrandr -q | grep HDMI-1)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar -c ~/.config/polybar/config.ini top --reload &

if [[ $external_monitor = *connected* ]]; then
    polybar -c ~/.config/polybar/config.ini top_external --reload &
fi
