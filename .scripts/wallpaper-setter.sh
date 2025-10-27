#! /bin/bash

image=~/Pictures/wallpapers/\
$(find ~/Pictures/wallpapers/* -type f -printf '%f\n' | \
rofi -theme ~/.config/rofi/tokyonight.rasi -dmenu -p '󰥷 ' -i) && \
swww img --transition-type fade --transition-step 255 --transition-duration 3 "$image"
