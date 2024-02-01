#!/bin/bash

reflector -c Russia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sed -i "s/^#ParallelDownloads = .*/ParallelDownloads = 10/" /etc/pacman.conf
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
sed -e '/en_US.UTF-8/s/^#*//g' -i /etc/locale.gen 
sed -e '/ru_RU.UTF-8/s/^#*//g' -i /etc/locale.gen
locale-gen
cp /arch_linux/other/locale.conf /etc/locale.conf
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
pacman -S mesa networkmanager pipewire bluez bluez-utils flatpak timeshift acpid openssh base-devel xdg-utils neofetch inxi mangohud gamemode gamescope net-tools keepassxc steam noto-fonts-emoji noto-fonts libappimage zsh code

sed -i "s/#governor='ondemand'/governor='performance'/" /etc/default/cpupower
echo "vm.max_map_count = 2147483642" >> /etc/sysctl.d/80-gamecompatibility.conf
setcap 'CAP_SYS_NICE=eip' $(which gamescope)

sed -i 's/MODULES=()/MODULES=(amdgpu btrfs)/' /etc/mkinitcpio.conf
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
    rm /boot/refind_linux.conf
    rm /boot/EFI/refind/refind.conf
    cp /arch_linux/refind_conf/refind_linux.conf /boot/refind_linux.conf
    cp /arch_linux/refind_conf/refind.conf /boot/EFI/refind/refind.conf
fi

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cpupower
systemctl enable acpid

echo "Enter username"
read username
useradd -m -g users -G wheel -s /bin/zsh $username
echo $username:$password | chpasswd

echo "$username ALL=(ALL) ALL" >> /etc/sudoers.d/$username

if [ $bootloader == 1 ]; then 
    echo "Done! Need to reboot."
elif [ $bootloader == 2 ]; then 
    echo "Done! Please make configuration refind_linux and refined and reboot."
fi
