DEFAULT_USER="Yoshiro"

export TERM=xterm-256color


HISTFILE=~/.zhistory
SAVEHIST=100000
HISTSIZE=10000

# ビープ音を鳴らさないようにする
setopt no_beep

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# パスの自動補完
autoload -U compinit
compinit -u

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

setopt list_packed
