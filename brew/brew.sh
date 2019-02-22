#! /bin/bash

DOTFILES_ROOT=~/dotfiles
CURRNET_DIR=`pwd`

which brew >/dev/null 2>&1 && brew doctor
which brew >/dev/null 2>&1 && brew update

brew upgrade --all

brew install rcmdnk/file/brew-file
ln -snfv $CURRENT_DIR/Brewfile $HOME/.config/brewfile/Brewfile

brew file install

