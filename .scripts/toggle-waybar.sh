#!/bin/bash
if pgrep -x waybar > /dev/null; then
    killall waybar
    waybar &
else
    waybar &
fi
