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

# =========================
# Ruby
# =========================
eval "$(rbenv init -)"

# =========================
# Python pyenv
# =========================
eval "$(pyenv init -)"

# =========================
# User setting
# =========================

DEFAULT_USER="Yoshiro"

export TERM=xterm-256color

# dotfiles path
export DOTFILES=$HOME/dotfiles

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# ビープ音を鳴らさないようにする
setopt no_beep

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# ヒストリ
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# パスの自動補完
autoload -U compinit
compinit

# cd + Tab で移動履歴表示
setopt auto_pushd

# 直前と同じコマンドは履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# Ctrl+Dでzshを終了しない
setopt ignore_eof


# =========================
# Alias
# =========================

alias relogin='exec $SHELL -l'


# =========================
# Hash
# =========================


# =========================
# local setting
# =========================
[ -f ~/.zshrc.local ] && source $DOTFILES/zsh/.zshrc.local
