#!/bin/bash

DOTFILES_ROOT=~/dotfiles
CURRNET_DIR=`pwd`

# check directory
cd ~/dotfiles
if [ $? -ne 0 ]; then
  die "not found: $DOTFILES_ROOT"
fi


# ----------------------
# Install tools
# ----------------------

# install homebrew
if has "brew"; then
  echo "Already installed Homebrew"
else
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # install dependencies
  $DOTFILES_ROOT/brew/brew.sh
  wait
  echo "Done Homebrew"
fi

# ----------------------
# Set symlinks
# ----------------------

echo "Setting symlinks..."
for file in .??*
do
  [ "$file" = ".git" ] && continue
  [ "$file" = ".vimrc.*" ] && continue
  ln -snfv "$DOTFILES_ROOT/$file" "$HOME/$file"
done
echo "Done symlinks"

# ----------------------
# Prezto
# ----------------------

echo "Prezto setup..."
cd "${ZDOTDIR:-$HOME}/.zprezto"
if [ $? -ne 0 ]; then
  echo "${ZDOTDIR:-$HOME}/.zprezto"

  echo "excute zsh..."

  echo "git clone for zprezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  echo "finished"

  echo "copy files..."
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

echo "Done Prezto"


# ----------------------
# Neovim
# ----------------------

echo "Neovim setup..."
cd ~/.config
if [ $? -ne 0 ]; then
  echo "Not found .config/"
  echo "Setup .config/ ..."
  mkdir -p ~/.config/nvim
  ln -snfv "$DOTFILES_ROOT/.vimrc" "$HOME/.config/nvim/init.vim"
fi
echo "Done Neovim"

