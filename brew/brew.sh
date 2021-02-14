#! /bin/bash

DOTFILES_ROOT=~/dotfiles
CURRNET_DIR=`pwd`

if ! command -v brew >/dev/null 2>&1; then
  echo "brew command could not be found"
  exit
fi

ln -s $CURRENT_DIR/.Brewfile $HOME/.Brewfile

brew bundle
