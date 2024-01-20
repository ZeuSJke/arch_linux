#!/bin/bash

#git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm

echo "gnome(1) or kde(2)"
read de
if [ $de == 1 ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton extension-manager
    sudo flatpak install -y  net.nokyan.Resources
elif [ $de == 2 ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton 
    sudo pacman -S xdg-desktop-portal-gtk
fi

printf "Done!"