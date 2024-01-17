#!/bin/bash

sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc 1
sudo hwclock --systohc

sudo pacman -Sy
sudo pacman -S --noconfirm gnome firefox gnome-tweaks gnome-boxes mangohud papirus-icon-theme
sudo pacman -R --noconfirm gnome-tour epiphany gnome-maps gnome-text-editor gnome-tour simple-scan

#git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
#git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm

sudo flatpak install -y com.spotify.Client
sudo flatpak install -y com.github.tchx84.Flatseal
sudo flatpak install -y org.telegram.desktop
sudo flatpak install -y com.mattermost.Desktop
sudo flatpak install -y com.vscodium.codium
sudo flatpak install -y com.mattjakeman.ExtensionManager
sudo flatpak install -y io.missioncenter.MissionCenter
#sudo flatpak install -y de.haeckerfelix.Fragments
sudo flatpak install -y org.qbittorrent.qBittorrent
sudo flatpak install -y com.discordapp.Discord
sudo flatpak install -y flathub net.davidotek.pupgui2

sudo systemctl enable gdm

printf "\e[1;32m Done!.\e[0m"
