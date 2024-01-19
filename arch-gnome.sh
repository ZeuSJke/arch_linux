#!/bin/bash

sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc 1
sudo hwclock --systohc

sudo pacman -Sy
sudo pacman -S --noconfirm gnome firefox gnome-tweaks gnome-boxes mangohud papirus-icon-theme telegram-desktop discord code fragments
sudo pacman -Rs --noconfirm gnome-tour epiphany gnome-maps gnome-text-editor gnome-tour simple-scan

sudo systemctl enable gdm

printf "Done!"
