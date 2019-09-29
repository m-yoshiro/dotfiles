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

# Nodenv
export PATH="$HOME/.nodenv/bin:$PATH"

# Ruby rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python pyenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "$PYENV_ROOT" ]; then
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
  # https://github.com/yyuu/pyenv/issues/106#issuecomment-94921352
  alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
fi

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# Composer global
export PATH="$HOME/.composer/vendor/bin:$PATH"

# tmuxinator
export EDITOR='nvim'

# =========================
# load zsh diles
# =========================

source "$DOTFILES/zsh/aliases.zsh"
source "$DOTFILES/zsh/config.zsh"
source "$DOTFILES/zsh/bindkey.zsh"

# =========================
# local setting
# =========================
[ -f ~/.zshrc.local ] && source "$DOTFILES/zsh/.zshrc.local"

# =========================
# running tmux
# =========================

if [[ "$TERM"!="screen-256color" ]]; then
  # Check running on vscode
  # https://github.com/Microsoft/vscode/pull/30346
  if [[ ${TERM_PROGRAM} == "vscode" ]]; then
    # https://medium.com/@joaomoreno/persistent-terminal-sessions-in-vs-code-8fc469ed6b41
    SESSION="vscode`pwd | md5`"
    tmux attach-session -d -t $SESSION || tmux new-session -s $SESSION
  else
    # usernameにpresiodが含まれる場合は差し替える
    tmux_user=$(echo $USER | tr . _ )
    tmux attach-session -t "$tmux_user" || tmux new-session -s "$tmux_user"
  fi
fi
