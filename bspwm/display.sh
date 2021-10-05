#!/bin/bash

# Get monitor status
external_monitor=$(xrandr -q | grep HDMI-1)
# Get rate for external monitor status
rate=$(xrandr | grep 1920x1080)

# Match if connected and toggles primary display to hdmi
if [[ $external_monitor = *connected* ]]; then
    xrandr --output eDP-1 --mode 1366x768 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --rate 74.97 --rotate normal --right-of eDP-1
    # If rate is not 75Hz for external monitor then set
    if [[ $rate != *'74.97*'* ]]; then
        xrandr --output HDMI-1 --mode 1920x1080 --rate 74.97
    fi
fi
