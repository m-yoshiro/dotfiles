#!/usr/bin/env zsh

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

install_prezto