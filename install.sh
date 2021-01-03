#!/bin/bash

DOTFILES_ROOT=~/dotfiles
CURRNET_DIR=`pwd`

# check directory
cd $DOTFILES_ROOT
if [ $? -ne 0 ]; then
  die "not found: $DOTFILES_ROOT"
fi

# ----------------------
# Install tools
# ----------------------

install_homebrew() {
  echo "Setup Homebrew..."
  # install homebrew
  if has "brew"; then
    echo "Already installed Homebrew"
  else
    echo "Install Homebrew..."

    if test "$(uname -m)" = "x86_64"; then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif test "$(uname)" = "arm64"; then
      echo "Installing to /usr/local for using emulation with Rosseta 2 (1/2)"
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

      echo "Installing to /opt/homebrew for natively running on macOS ARM (2/2)"
      cd /opt
      mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
    fi

    # install dependencies
    $DOTFILES_ROOT/brew/brew.sh
    wait
    echo "Done Homebrew"
  fi
}

# ----------------------
# Set symlinks
# ----------------------

create_symlinks() {
  echo "Create symlinks..."
  for file in .??*
  do
    [ "$file" = ".git" ] && continue
    [ "$file" = ".vimrc.*" ] && continue
    ln -snfv "$DOTFILES_ROOT/$file" "$HOME/$file"
  done
  echo "Done symlinks"
}

# ----------------------
# Prezto
# ----------------------

install_prezto() {
  echo "Prezto setup..."
  cd "${ZDOTDIR:-$HOME}/.zprezto"
  if [ $? -ne 0 ]; then
    echo "${ZDOTDIR:-$HOME}/.zprezto"

    echo "excute zsh..."

    echo "git clone for zprezto..."
    git clone --recursive --progress https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    echo "finished"

    echo "copy files..."
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    echo "Done Prezto"
  fi
}
