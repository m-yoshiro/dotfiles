# Initialize Prezto.
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

# --------
# Tools

# Anyenv
# https://github.com/anyenv/anyenv
if [ -d "${HOME}/.anyenv" ]; then
  eval "$(anyenv init -)"
fi

# Node.js
# Basicaly I use nodenv via anyenv.
#
# [nodebrew]
# NOTE: I will remove nodebrew if the necessity decreases.
if [ -d "${HOME}/.nodebrew" ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
  export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules
fi

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Composer global
export PATH="$HOME/.composer/vendor/bin:$PATH"

# tmuxinator
export EDITOR='nvim'

# =========================
# load zsh files
# =========================

source "$DOTFILES/zsh/aliases.zsh"
source "$DOTFILES/zsh/config.zsh"
source "$DOTFILES/zsh/bindkey.zsh"
source "$DOTFILES/zsh/completion.zsh"

# =========================
# local setting
# =========================
[ -f ~/.zshrc.local ] && source "$DOTFILES/zsh/.zshrc.local"

# =========================
# Homebrew
# =========================

# https://zenn.dev/ress/articles/069baf1c305523dfca3d
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /usr/local/bin(N-/)
  $path
)

if [[ "${(L)$( uname -s )}" == darwin ]] && (( $+commands[arch] )); then
  alias brew_x86="arch -arch x86_64 /usr/local/bin/brew"
  alias x64='exec arch -arch x86_64 "$SHELL"'
  alias a64='exec arch -arch arm64e "$SHELL"'
  switch-arch() {
    if  [[ "$(uname -m)" == arm64 ]]; then
      arch=x86_64
    elif [[ "$(uname -m)" == x86_64 ]]; then
      arch=arm64e
    fi
    exec arch -arch $arch "$SHELL"
  }
fi

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
