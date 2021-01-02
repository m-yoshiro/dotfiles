#! /bin/bash

DOTFILES_ROOT=~/dotfiles
CURRNET_DIR=`pwd`

if ! command -v brew >/dev/null 2>&1; then
  echo "brew command could not be found"
  exit
fi

brew doctor
brew update
brew upgrade --all

brew install rcmdnk/file/brew-file
ln -snfv $CURRENT_DIR/Brewfile $HOME/.config/brewfile/Brewfile

brew file install
