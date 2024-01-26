#!/bin/bash

sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc 1
sudo hwclock --systohc

sudo pacman -Sy
sudo pacman -S --noconfirm plasma
sudo pacman -S --noconfirm telegram-desktop discord firefox konsole dolphin ark partitionmanager filelight ktorrent spectacle gwenview papirus-icon-theme xdg-desktop-portal-gtk

sudo systemctl enable sddm

printf "Done!"
