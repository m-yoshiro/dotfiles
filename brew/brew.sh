#! /bin/bash

link_brewfile() {
  local current_dir
  current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")

  if ! command -v brew >/dev/null 2>&1; then
    echo "brew command could not be found"
    exit
  fi

  ln -s $current_dir/.Brewfile $HOME/.Brewfile
}

link_brewfile
brew bundle --global
