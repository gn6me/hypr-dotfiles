#!/bin/bash

# WALLPAPERS PATH
DIR=$HOME/.config/hypr/wallpapers

# wofi window config (in %)
WIDTH=20
HEIGHT=30

PICS=($(ls ${DIR} | grep -e ".jpg$" -e ".jpeg$" -e ".png$" -e ".gif$"))

RANDOM_PIC=${PICS[$RANDOM % ${#PICS[@]}]}
RANDOM_PIC_NAME="${#PICS[@]}. random"

# WOFI STYLES
CONFIG="$HOME/.config/rofi/config.rasi"
STYLE="$HOME/.config/rofi/themes/selector.rasi"

# to check if swaybg is running

if [[ $(pidof waypaper) ]]; then
  pkill waypaper
fi

## Wofi Command
rofi_command="rofi -dmenu \
			--prompt choose...
			--no-config --color $COLORS \
			--width=$WIDTH% --height=$HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"

menu() {
  # Here we are looping in the PICS array that is composed of all images in the $DIR
  # folder
  for i in ${!PICS[@]}; do
    # keeping the .gif to make sue you know it is animated
    if [[ -z $(echo ${PICS[$i]} | grep .gif$) ]]; then
      printf "$i. $(echo ${PICS[$i]} | cut -d. -f1)\n" # n°. <name_of_file_without_identifier>
    else
      printf "$i. ${PICS[$i]}\n"
    fi
  done

  printf "$RANDOM_PIC_NAME"
}

swww query || swww init

main() {
  choice=$(menu | ${rofi_command})

  # no choice case
  if [[ -z $choice ]]; then return; fi

  # random choice case
  if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
    swww img ${DIR}/${RANDOM_PIC} $SWWW_PARAMS
    return
  fi

  pic_index=$(echo $choice | cut -d. -f1)
  waypaper --walpaper ${DIR}/${PICS[$pic_index]}
}

# Check if wofi is already running
if pidof rofi >/dev/null; then
  killall rofi
  exit 0
else
  main
fi

# Uncomment to launch something if a choice was made
# if [[ -n "$choice" ]]; then
# Restart Waybar
# fi
