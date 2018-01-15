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


#vim
rm -rf $HOME/.vim
ln -s $PWD/vim $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

rm -rf $HOME/.xinitrc
ln -s $PWD/xinitrc $HOME/.xinitrc

rm -rf $HOME/bin
ln -s $PWD/bin $HOME/bin

rm -rf $HOME/.i3
ln -s $PWD/i3 $HOME/.i3

rm -rf $HOME/.vimperatorrc
ln -s $PWD/vimperatorrc $HOME/.vimperatorrc

rm -rf $HOME/.zshrc
ln -s $PWD/zshrc $HOME/.zshrc

mkdir_if_dns $HOME/.config
mkdir_if_dne $HOME/.config/lilyterm
rm -rf $HOME/.config/lilyterm/default.conf
ln -s $PWD/lilyterm/default.conf $HOME/.config/lilyterm/default.conf
