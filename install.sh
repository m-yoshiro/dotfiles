#!/bin/bash

DOTPATH=~/.dotfiles
GITHUB_URL=https://github.com/yoshiro4460/dotfiles.git

if has "git"; then
  git clone --recursive "$GITHUB_URL" "$DOTPATH"

  elif has "curl" || has "wget"; then
    tarball="https://github.com/yoshiro4460/dotfiles/archive/master.tar.gz"

    if has "curl"; then
      curl -L "$tarball"

    elif has "wget"; then
      wget -O - "$tarball"

    fi | tar xv -

    mv -f dotfiles-master "$DOTPATH"

  else
    die "curl or wget required"
fi

cd ~/.dotfiles
if [ $? -ne 0 ]; then
  die "not found: $DOTPATH"
fi

for file in .??*
do

  [ "$file" = ".git" ] && continue
  [ "$file" = ".vimrc.*" ] && continue

  ln -snfv "$DOTPATH/$file" "$HOME/$file"

done

# install oh-my-zsh
[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ ! -d ~/dotfiles/fonts/ ] && git clone git://github.com/powerline/fonts.git ~/dotfiles/fonts/

