#!/bin/bash

#FIRSTOFALL
#vim /etc/mkinitcpio.conf 
#MODULES(amdgpu radeon btrfs)
#mkinitcpio -p linux 
#vim /etc/default/cpupower
#governor='performance'
#change password 

reflector -c Russia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sed -i '37s/.//' /etc/pacman.conf
sed -i '90s/.//' /etc/pacman.conf
sed -i '91s/.//' /etc/pacman.conf
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
sed -i '171s/.//' /etc/locale.gen
sed -i '398s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=ru" >> /etc/vconsole.conf
echo "FONT=cyr-sun16" >> /etc/vconsole.conf
echo "zeusjke-arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 zeusjke-arch.localdomain    zeusjke-arch" >> /etc/hosts
echo root:password | chpasswd

pacman -Sy
pacman -S --noconfirm networkmanager pipewire mesa bluez bluez-utils flatpak timeshift acpid openssh base-devel rsync htop xdg-utils neofetch inxi mangohud gamemode gamescope net-tools

#uncommit if want grub bootloader
#pacman -S --noconfirm grub grub-btrfs efibootmgr os-prober 
#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch-grub
#grub-mkconfig -o /boot/grub/grub.cfg 

#uncommit if want refind bootloader !CHANGE! your mount device in base/refind_conf.conf
#pacman -S --noconfirm refind
#refind-install
#rm /boot/refind_linux.conf
#cp /arch-linux/refind_linux.conf /boot/refind_linux.conf

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cpupower
systemctl enable sshd
systemctl enable acpid


useradd -m zeusjke
echo zeusjke:password | chpasswd
usermod -aG wheel zeusjke

echo "zeusjke ALL=(ALL) ALL" >> /etc/sudoers.d/zeusjke

printf "\e[1;32m Done!. Please reboot.\e[0m"