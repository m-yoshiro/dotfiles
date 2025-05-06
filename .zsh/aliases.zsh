# --- General ---------

alias relogin='exec $SHELL -l'

# Navigation
alias cdd="cd .."
alias cddd="cd ../.."
alias cdddd="cd ../../.."
alias cddddd="cd ../../../.."
alias cdddddd="cd ../../../../.."
alias cddddddd="cd ../../../../../.."
alias -- -="cd -"

# Resent directories
alias zf='cd $(zoxide query -l | fzf --reverse --prompt "Zoxide> ")'

# --- Tools -----------

# Chrome CLI
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# --- Git aliases ---------

# Git (g)
alias g='git'

alias -g B='`git branch -a | sed "s/remotes\///" | sort -u | fzf --prompt "BRANCH>" | tr -d " \\*"`'

# Branch (b) – including checkout
alias gb='git branch'
alias gbc='git checkout -b'

# Commit (c)
alias gco='git checkout'
alias gcob='git checkout B'

# GitHub CLI (gh)
alias ghbr='gh browse -R $(ghq list | fzf --prompt "GIT BRANCH>")'

# --- Tmux (T) ---------

alias Tgr=tmux_select_git_repo
alias Tdt=tmux_select_dotfile