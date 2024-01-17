#!/bin/bash

sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc 1
sudo hwclock --systohc

sudo pacman -Sy
sudo pacman -S --noconfirm plasma plasma-wayland-session 
sudo pacman -S --noconfirm telegram-desktop discord code firefox konsole dolphin ark partitionmanager filelight ktorrent spectacle gwenview papirus-icon-theme


#git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
#git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm
#paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton

sudo systemctl enable sddm

printf "\e[1;32m Done!.\e[0m"
