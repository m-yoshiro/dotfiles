#! /bin/bash

if hash !anyenv 2>/dev/null; then
  if hash brew 2>/dev/null; then
    echo "Install anyenv..."
    brew install anyenv

    echo "Initialize anyenv"
    anyenv init

    anyenv install nodenv
    anyenv install rbenv
  else
    echo "`brew install anyanv` can't run. `brew` command is not found."
  fi
fi