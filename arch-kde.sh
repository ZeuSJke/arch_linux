#!/bin/bash

sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc 1
sudo hwclock --systohc

sudo pacman -Sy
sudo pacman -S --noconfirm plasma plasma-wayland-session 
sudo pacman -S --noconfirm telegram-desktop discord code firefox konsole dolphin ark partitionmanager filelight ktorrent spectacle gwenview papirus-icon-theme

sudo systemctl enable sddm

printf "Done!"
