# Initialize Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export LANG=ja_JP.UTF-8


# =========================
# PATH
# =========================

export DOTFILES=$HOME/dotfiles

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$PATH"

# --------
# Tools

# Anyenv
# https://github.com/anyenv/anyenv
if [ -d "${HOME}/.anyenv" ]; then
  eval "$(anyenv init -)"
fi

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Flutter
export PATH="$HOME/flutter/bin:$PATH"

# Node.js
# https://github.com/volta-cli/volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


# =========================
# load zsh files
# =========================

source "$DOTFILES/.zsh/aliases.zsh"
source "$DOTFILES/.zsh/config.zsh"
source "$DOTFILES/.zsh/bindkey.zsh"
source "$DOTFILES/.zsh/completion.zsh"

# =========================
# local setting
# =========================
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# =========================
# Tmux
# =========================

if [[ "$TERM"!="screen-256color" ]]; then
  # Check running on vscode
  # https://github.com/Microsoft/vscode/pull/30346
  if [[ ${TERM_PROGRAM} == "vscode" ]]; then
    # https://medium.com/@joaomoreno/persistent-terminal-sessions-in-vs-code-8fc469ed6b41
    SESSION="vscode`pwd | md5`"
    tmux attach-session -d -t $SESSION || tmux new-session -s $SESSION
  else
    # Excute initialy when tmux haven't attatched a current session yet.
    if [ ! "$TMUX" ]; then
        # usernameにpresiodが含まれる場合は差し替える
        tmux_user=$(echo $USER | tr . _ )
        tmux new-session -A -t "$tmux_user"
    fi
  fi
fi
