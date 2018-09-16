alias relogin='exec $SHELL -l'

# Chrome Cli
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# Git
alias g='git'
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | tr -d " \\*"`'

alias gcd='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
