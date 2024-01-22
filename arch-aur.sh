#!/bin/bash

git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm

echo "gnome(1) or kde(2)"
read de
if [ $de == 1 ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton extension-manager vscodium-bin 
    sudo flatpak install -y net.nokyan.Resources
    sudo flatpak install -y com.github.tchx84.Flatseal
    sudo flatpak install -y de.haeckerfelix.Fragments
elif [ $de == 2 ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton vscodium-bin 
    sudo pacman -S xdg-desktop-portal-gtk
fi

printf "Done!"