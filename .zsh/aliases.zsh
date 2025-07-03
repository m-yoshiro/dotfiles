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

# ls
if command -v eza >/dev/null 2>&1; then
  alias ls="eza"
else
  alias ls="ls"
fi
alias lsa="ls -a"

# --- Tools -----------

# Chrome CLI
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# --- Git aliases ---------

# Git (g)
alias g='git'

# Get branch name via fzf with normalization
alias -g B='`git branch -a | sed "s/remotes\///" | sort -u | fzf --prompt "BRANCH>" | tr -d " \\*" | tr -d " \\+"`'

# Branch (b) – including checkout
alias gb='git branch'
alias gbc='git checkout -b'

# Commit (c)
alias gco='git checkout'
alias gcob='git checkout B'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'

# Fetch (f)
alias gf='git fetch'
alias gfa='git fetch --all'

# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive --autosquash'

# Working trees (W)
alias gW='git worktree'
alias gWa='git_worktree_add'
alias gWc='cd "$(wtree_select)"'
alias gWd='git_worktree_dir_of B'
alias gWl='git worktree list'
alias gWm='git worktree move "$(wtree_select)"'
alias gWp='git worktree prune'
alias gWx='git worktree remove "$(wtree_select)"'
alias gWX='git worktree remove --force'

# GitHub CLI (gh)
alias ghbr='gh browse'

# --- Tmux (T) ---------
# required functions.zsh
alias Tgr=tmux_select_git_repo
alias Tgw=tmux_select_work
alias Tgd=tmux_select_dotfile