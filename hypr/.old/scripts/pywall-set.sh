#!/bin/bash

notify-send "Saving theme..."

# Set wallpaper color scheme
WALL=${1}
swww img "${WALL}"
wal -n -s -i ${WALL}

# Set directories
destdir=~/.config/hypr/.current_wal
rofiwal=~/.config/rofi/wal.png
rofiblur=~/.config/rofi/.blur

# For hyprland
echo "\$wallpaper=${WALL}" >"$destdir"

# For rofi
magick ${WALL} -resize 1200x $rofiwal

# Copy colors to dotfiles
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/

notify-send "Theme saved!"
