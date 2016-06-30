#!/bin/bash

# Symlinks config files to their appropriate place in the home folder
# If a file already exists (e.g. you already have a .zshrc),
#  it will not clobber it
ln -s ./vim $HOME/.vim
ln -s ./xinitrc $HOME/.xinitrc
ln -s ./bin $HOME/bin
ln -s ./i3 $HOME/.i3
ln -s ./vimperatorrc $HOME/.vimperatorrc
ln -s ./zshrc $HOME/.zshrc
