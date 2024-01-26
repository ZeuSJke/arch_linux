#!/bin/bash

git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "gnome(1) or kde(2)"
read de
if [ $de == 1 ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton vscodium-bin 
elif [ $de == 2 ]; then 
    paru -S --noconfirm mattermost-desktop-bin spotify timeshift-autosnap portproton vscodium-bin 
fi

printf "Done!"