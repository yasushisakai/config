#!/bin/bash

killall -q polybar

# make sure polybar is not there
while grep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bar for main display
polybar main 2>&1 | tee -a /tmp/polybar.log & disown

echo "main bar launched"

# if we have 'HDMI2' launch that
ext_monitor=$(xrandr --query | grep 'HDMI2')
if [[ $ext_monitor = *connected* ]]; then
	polybar secondary &
fi

echo "secondary bar launched"
