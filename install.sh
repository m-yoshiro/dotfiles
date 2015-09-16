#!/bin/bash

DOT_FILES=( .vimrc .gvimrc .bashrc .zshrc)


for file in ${DOT_FILES[@]}
do

  ln -s $HOME/dotfiles/$file $HOME/$file

done

# install oh-my-zsh
[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ ! -d ~/dotfiles/fonts/ ] && git clone git://github.com/powerline/fonts.git ~/dotfiles/fonts/

