# =========================
# Prezto.
# =========================
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export LANG=ja_JP.UTF-8


# =========================
# PATH
# =========================

# dotfiles path
export DOTFILES=$HOME/dotfiles

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$PATH"

# Nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules

# Ruby rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python pyenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "$PYENV_ROOT" ]; then
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi
# =========================
# load zsh diles
# =========================

source "$DOTFILES/zsh/aliases.zsh"
source "$DOTFILES/zsh/config.zsh"

# =========================
# local setting
# =========================
[ -f ~/.zshrc.local ] && source "$DOTFILES/zsh/.zshrc.local"
