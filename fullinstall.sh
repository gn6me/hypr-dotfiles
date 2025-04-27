#!/bin/bash

echo " "
echo "Installing packages"

sudo pacman -S yay thunar thunar-volman thunar-archive-plugin tumbler rofi-wayland kitty awesome-terminal-fonts otf-font-awesome ttf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd swaync pipewire wireplumber xdg-desktop-portal-hyprland hyprland hyprpolkitagent hypridle hyprlock swww kitty nwg-look hyprpciker --needed

yay -S hyprshot waypaper zen-browser-bin --noconfirm --needed

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
