export LANG=ja_JP.UTF-8

HISTFILE=~/.zhistory
SAVEHIST=100000
HISTSIZE=10000

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$HOME/.nodebrew/current/bin:$PATH"

# =========================
# Nodebrew
# =========================
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# =========================
# Ruby rbenv
# =========================
export PATH="$HOME/.rbenv/bin:$PATH"

# =========================
# Python pyenv
# =========================
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
