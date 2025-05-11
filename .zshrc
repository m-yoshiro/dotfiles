# =========================
# ZSH
# =========================

# ZSH Framework
source "$HOME/dotfiles/.zsh/zimfw.zsh"

export LANG=ja_JP.UTF-8

# =========================
# PATH
# =========================

export DOTFILES=$HOME/dotfiles

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$PATH"

# --------
# Tools

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Tool version manager
if [ -x ~/.local/bin/mise ]; then
  eval "$(~/.local/bin/mise activate zsh)"
fi

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Flutter
export PATH="$HOME/flutter/bin:$PATH"

# TheFuck
eval $(thefuck --alias)

# =========================
# load zsh files
# =========================

source "$DOTFILES/.zsh/config.zsh"
source "$DOTFILES/.zsh/functions.zsh"
source "$DOTFILES/.zsh/aliases.zsh"
source "$DOTFILES/.zsh/bindkey.zsh"

# =========================
# local setting
# =========================
[ -r ~/.zshrc.local ] && source ~/.zshrc.local

# =========================
# Tmux
# =========================

if [[ "$TERM"!="screen-256color" ]]; then
  # Check running on vscode
  # https://github.com/Microsoft/vscode/pull/30346
  if [[ ${TERM_PROGRAM} == "vscode" ]]; then
    # VSCodeの時にterminalウィンドウのresizeの度に不要な文字列が挿入されてしまうのでtmuxを起動しない
  else
    # Execute initially when tmux haven't attached a current session yet.
    if [ ! "$TMUX" ]; then
        # usernameにpresiodが含まれる場合は差し替える
        tmux_user=$(echo $USER | tr . _ )
        tmux new-session -A -t "$tmux_user"
    fi
  fi
fi

# =========================
# fzf
# =========================

export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --border --margin=1 --padding=1"
