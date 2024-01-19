#!/bin/bash

reflector -c Russia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sed -i "s/^#ParallelDownloads = .*/ParallelDownloads = 10/" /etc/pacman.conf
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
sed -e '/en_US.UTF-8/s/^#*//g' -i /etc/locale.gen 
sed -e '/ru_RU.UTF-8/s/^#*//g' -i /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=ru" >> /etc/vconsole.conf
echo "FONT=cyr-sun16" >> /etc/vconsole.conf
echo "Enter hostname"
read hostname
echo $hostname >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $hostname.localdomain    $hostname" >> /etc/hosts
echo "Enter password"
read password
echo root:$password | chpasswd

pacman -Sy
pacman -S --noconfirm networkmanager pipewire mesa bluez bluez-utils flatpak timeshift acpid openssh base-devel rsync htop xdg-utils neofetch inxi mangohud gamemode gamescope net-tools keepassxc

sed -i 's/governor=''/governor='performance'/' /etc/default/cpupower

sed -i 's/MODULES=()/MODULES=(amdgpu radeon btrfs)/' /etc/mkinitcpio.conf
mkinitcpio -p linux 


echo "grub(1) or refind(2)"
read bootloader
if [ $bootloader == 1 ]; then 
    pacman -S --noconfirm grub grub-btrfs efibootmgr os-prober 
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch-grub
    grub-mkconfig -o /boot/grub/grub.cfg 
elif [ $bootloader == 2 ]; then 
    pacman -S --noconfirm refind
    refind-install
    #rm /boot/refind_linux.conf
    #cp /arch_linux/refind_linux.conf /boot/refind_linux.conf
fi

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cpupower
systemctl enable sshd
systemctl enable acpid

echo "Enter username"
read username
useradd -m $username
echo $username:$password | chpasswd
usermod -aG wheel $username

echo "$username ALL=(ALL) ALL" >> /etc/sudoers.d/$username

echo "Done!. Please reboot."