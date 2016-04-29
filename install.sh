#!/bin/bash

DOTFILES_ROOT=~/dotfiles
CURRNET_DIR=`pwd`

# check directory
cd ~/.dotfiles
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
ln -snfv "$DOTFILES_ROOT/zsh/prezto_overrides/.zpreztorc" "${ZDOTDIR:-$HOME}/.zprezto/runcoms/.zpreztorc"
echo "Done symlink"
