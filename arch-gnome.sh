#!/bin/bash

sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc 1
sudo hwclock --systohc

sudo pacman -Sy
sudo pacman -S --noconfirm gnome firefox gnome-tweaks mangohud papirus-icon-theme telegram-desktop discord resources
sudo pacman -Rs --noconfirm gnome-tour epiphany gnome-maps gnome-text-editor simple-scan gnome-user-docs yelp gnome-system-monitor malcontrol

sudo flatpak install -y com.github.tchx84.Flatseal
sudo flatpak install -y de.haeckerfelix.Fragments
#sudo flatpak install -y com.mattjakeman.ExtensionManager

sudo systemctl enable gdm

printf "Done!"
