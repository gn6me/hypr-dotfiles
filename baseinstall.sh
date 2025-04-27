#!/bin/bash

echo " "
echo "Installing packages"

sudo pacman -S yay hyprland kitty swaync waybar rofi-wayland ttf-jetbrains-mono ttf-jetbrains-mono-nerd hyprpolkitagent hyprilde hyprlock xdg-desktop-portal-hyprland swww hyprpicker --needed

sudo yay -S hyprshot waypaper --noconfirm --needed

git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ..

echo " "
echo "Done!"
sleep 0.5

read -r -p "Backup current dotfiles? [Y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo " "
  echo "Backing up current dotfiles"

  mkdir ~/dotfiles.bak
  cp -r ~/.config/. ~/dotfiles.bak/
  echo "Done!"
  sleep 0.5
else
  echo " "
  echo "Skipping backup..."
  sleep 0.5
fi

echo " "
echo "Cloning dotfiles..."

cp -r hypr swaync waybar waypaper rofi ~/.config/

echo "Copying fonts"
mkdir ~/.fonts
cp -r fonts/. ~/.fonts

echo "Copying wallpapers"
mkdir ~/.wallpapers
cp -r wallpapers/. ~/.wallpapers

echo " "
echo "Installation finished! If you are already running hyprland, please log out and log back in"
