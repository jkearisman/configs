#!/bin/bash

sudo pacman -S $(cat packages.txt) --noconfirm


#Setting up pacaur (cower and expac are dependancies)
sudo pacman -S expac --noconfirm
git clone https://aur.archlinux.org/cower.git
cd cower
makepkg -i --noconfirm
cd ..
rm -rf cower
git clone https://aur.archlinux.org/pacaur.git
cd pacaur
makepkg -i --noconfirm
cd ..
rm -rf cower



function mkdir_if_dne {
	if [[ ! -d $1 ]]
	then
		mkdir $1
	fi
}

function rm_if_e {
	if [[ -e $1 || -d $1 ]]
	then
		rm -r $1
	fi
}

#vim
rm_if_e $HOME/.vim
ln -s $PWD/vim $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


rm_if_e $HOME/.xinitrc
ln -s $PWD/xinitrc $HOME/.xinitrc

rm_if_e $HOME/bin
ln -s $PWD/bin $HOME/bin

rm_if_e $HOME/.i3
ln -s $PWD/i3 $HOME/.i3

rm_if_e $HOME/.vimperatorrc
ln -s $PWD/vimperatorrc $HOME/.vimperatorrc

rm_if_e $HOME/.zshrc
ln -s $PWD/zshrc $HOME/.zshrc

mkdir_if_dns $HOME/.config
mkdir_if_dne $HOME/.config/lilyterm
rm_if_e $HOME/.config/lilyterm/default.conf
ln -s $PWD/lilyterm/default.conf $HOME/.config/lilyterm/default.conf
