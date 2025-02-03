#!/bin/bash

clear
echo "Are you logged on Hyprland right now? [Y/N]"
read hypr
option="${hypr^^}"
if [ "$option" == "Y" ]; then
        hyprctl monitors all
        echo "type your main monitor, example [DP-1, HDMI-1]"
        read monitor
        monitor="${monitor^^}"
        sed -i "s/DP-1/$monitor/" ./hypr/hyprland.conf
        echo "type the refresh rate of your monitor, example [60, 140, 240]"
        read refresh
        sed -i "s/@240/@$refresh/" ./hypr/hyprland.conf
        echo "type the resolution of your monitor, example [1920x1080, 1280x720]"
        read resolution
        sed -i "s/1920x1080@$refresh/$resolution@$refresh/" ./hypr/hyprland.conf
    echo "Do you have a second monitor? [Y/N]"
    read hypr
    option="${hypr^^}"
    if [ "$option" == "Y" ]; then
        hyprctl monitors all
        echo "type your monitor, example [DP-2, HDMI-2]"
        read monitor
        monitor="${monitor^^}"
        sed -i "s/DP-2/$monitor/" ./hypr/hyprland.conf
        echo "type the refresh rate of your monitor, example [60, 140, 240]"
        read refresh
        sed -i "s/@144/@$refresh/" ./hypr/hyprland.conf
        echo "type the resolution of your monitor, example [1920x1080, 1280x720]"
        read resolution
        sed -i "s/1920x1080@$refresh/$resolution@$refresh/" ./hypr/hyprland.conf
        clear
        echo "is the second monitor on the left or on the right side on your main one? [L/R]"
        read hypr
        option="${hypr^^}"
        if [ "$option" == "R" ]; then
            clear
            echo "type the width of your main display"
            echo "example: [1920, 1280]"
            read orientation
            sed -i "s/1920x0/${orientation}x0/" ./hypr/hyprland.conf
        else
            clear
            echo "type the width of your main display"
            echo "example: [1920, 1280]"
            read orientation
            sed -i "s/1920x0/-${orientation}x0/" ./hypr/hyprland.conf
            fi
    else
        sed -i "s/monitor = DP-2, 1920x1080@144, 1920x0, 1/monitor = DP-2, disabled/" ./hypr/hyprland.conf
        sed -i "s/monitor:DP-2/monitor:DP-1/" ./hypr/hyprland.conf
    fi
else
    echo "When you log on hyprland, run this script again to set you monitor and refresh rate"
    sleep 4
fi
clear

cp -r ./fastfetch ./hypr ./kitty ./rofi ./waybar ./waypaper ./flavours -t ~/.config
sudo cp -r ./cursor/hypr-dots -t /usr/share/icons/
sudo cp -r ./icons/* -t /usr/share/icons/
sudo cp -r ./gtktheme/hypr-dots -t /usr/share/themes/
cp -r ./.zshrc ./.p10k.zsh -t ~/
waypaper --random
killall waybar &> /dev/null
waybar &> /dev/null &
cd ..
rm -rf hypr-dots
hyprctl setcursor hypr-dots 24
