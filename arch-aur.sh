#git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm

echo "gnome(1) or kde(2)"
read de
if [ $de == 1 ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton extension-manager
elif [ $de == 2 ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton 
fi

printf "Done!"