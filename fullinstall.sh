#!/bin/bash

echo " "
echo "Installing packages"

sudo pacman -S yay thunar thunar-volman thunar-archive-plugin tumbler kitty awesome-terminal-fonts otf-font-awesome ttf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd pipewire wireplumber xdg-desktop-portal-hyprland hyprland hyprpolkitagent hypridle hyprlock kitty nwg-look hyprpicker zsh starship timeshift steam wl-clipboard sddm ranger pavucontrol nvidia-open nvidia-utils networkmanager-openvpn netctl neovim fzf flatpak --needed

yay -S hyprshot quickshell noctalia-shell zen-browser-bin twintaillauncher-bin vesktop heroic-games-launcher-bin timeshift-autosnap gpu-screen-recorder bibata-cursor-theme --noconfirm --needed

echo " "
echo "Done!"
sleep 0.5

echo " "
echo "Cloning dotfiles..."

cp -r hypr noctalia ~/.config/

echo "Copying fonts"
mkdir ~/.fonts
cp -r fonts/. ~/.fonts

echo "Copying wallpapers"
mkdir ~/.wallpapers
cp -r wallpapers/. ~/.wallpapers

echo " "
echo "Installation finished! If you are already running hyprland, please log out and log back in"
