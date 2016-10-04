#!/bin/bash

# Symlinks config files to their appropriate place in the home folder
# If a file already exists (e.g. you already have a .zshrc),
#  it will not clobber it
rm -r $HOME/.vim
ln -s $PWD/vim $HOME/.vim
rm $HOME/.xinitrc
ln -s $PWD/xinitrc $HOME/.xinitrc
rm -r $HOME/bin
ln -s $PWD/bin $HOME/bin
rm -r $HOME/.i3
ln -s $PWD/i3 $HOME/.i3
rm $HOME/.vimperatorrc
ln -s $PWD/vimperatorrc $HOME/.vimperatorrc
rm $HOME/.zshrc
ln -s $PWD/zshrc $HOME/.zshrc
