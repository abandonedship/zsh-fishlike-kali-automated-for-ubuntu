#!/bin/bash

# kali fish like zsh auto-installer script

if [ $(id -u) != "0" ];
then
	printf "Run this program as root\n"
	exit
fi

printf "\n      Kali fish like auto-installer script\n"
printf "      zsh + autosuggestinons + syntax-highlighting\n\n"

printf "[\e[0;32m+\e[0m] Downloading/Installing zsh from original source\n"
sudo apt-get install zsh -y

printf "[\e[0;32m+\e[0m] Copying autosuggestions and syntax-highlighting plugins to /usr/share/\n"
cp -r files/zsh-autosuggestions /usr/share/
cp -r files/zsh-syntax-highlighting /usr/share/

printf "[\e[0;32m+\e[0m] Copying zshrc-template to /root/.zshrc and /home/$SUDO_USER/.zshrc\n"
cp -r files/zshrc-template /root/.zshrc
cp -r files/zshrc-template "/home/$SUDO_USER/.zshrc"

printf "[\e[0;32m+\e[0m] Setting zsh as default for $SUDO_USER and root users\n"
chsh -s $(which zsh) "$SUDO_USER"
chsh -s $(which zsh) root

printf "[\e[0;33m+\e[0m] Reboot is necessary to apply changes to $SUDO_USER, root user is ready\n\nIf you don't want restart your computer right now you can use $SUDO_USER zsh terminal by typing zsh\n"
