#!/bin/bash

# Set wallpaper color scheme
WALL=${1}
flavours generate dark ${WALL}
flavours apply generated
kitten themes --reload-in=all Base16 Generated

$wall=${1}
destdir=~/.config/hypr/.current_wal
echo "\$wallpaper=${WALL}" > "$destdir"

# Copy colors to dotfiles
#cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/
#cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/
#cp ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi
#cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/
