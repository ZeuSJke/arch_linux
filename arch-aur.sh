#git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm

echo "gnome or kde"
read de
if [ $de == "kde" ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton
elif [ $de == 'gnome' ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton extension-manager
fi

printf "Done!"