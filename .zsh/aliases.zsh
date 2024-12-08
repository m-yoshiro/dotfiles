alias relogin='exec $SHELL -l'

# Chrome Cli
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# Git
alias g='git'
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | tr -d " \\*"`'

alias ghbr='gh browse -R $(ghq list | peco)'

switch_or_create_tmux_session() {
  local dir=$1
  if [[ ! -z ${TMUX} ]]; then
    # convert to "organization/repository"
    repository=$(echo $dir | sed -E 's/.*\/(.*\/.*)$/\1/')
    session=${repository//./-}
    current_session=$(tmux list-sessions | grep 'attached' | cut -d":" -f1)

    if [[ $current_session =~ ^[0-9]+$ ]]; then
      cd $dir
      tmux rename-session $session
    else
      tmux list-sessions | cut -d":" -f1 | grep $session > /dev/null
      if [[ $? != 0 ]]; then
        tmux new-session -d -c $dir -s $session
      fi
      tmux switch-client -t $session
    fi
  else
    cd $dir
  fi
}

# https://qiita.com/yuki_ycino/items/ef5e6b63c8f9af2f03c0#ghq-%E3%81%A8-fzf-%E3%81%A7%E3%81%AE%E3%83%97%E3%83%AD%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AE%E7%AE%A1%E7%90%86%E3%81%A8%E7%A7%BB%E5%8B%95
function select-branch-with-tmux() {
  local dir repository session current_session
  dir=$(ghq root)/$(ghq list | peco --prompt 'GIT BRANCH>')

  if [[ $dir != "$(ghq root)/" ]]; then
    switch_or_create_tmux_session "$dir"
  fi
}

alias gcd=select-branch-with-tmux

# https://qiita.com/tuttieee/items/7fb6bcd333b2c8cb0a2a
function ghq-new() {
    local REPONAME=$1

    if [ -z "$REPONAME" ]; then
        echo 'Repository name must be specified.'
        return
    fi

    local TMPDIR=/tmp/ghq_new
    local TMPREPODIR=$TMPDIR/$REPONAME

    mkdir -p $TMPREPODIR
    cd $TMPREPODIR

    gh repo create

    local REPOURL=$(git remote get-url origin)
    local REPOPATH=$(echo $REPOURL | sed -e 's/^https:\/\///' -e 's/^git@//' -e 's/\.git$//' -e 's/github.com:/github.com\//')
    local USER_REPO_NAME=$(echo $REPOPATH | sed -e 's/^github\.com\///')

    ghq get $USER_REPO_NAME

    cd $(ghq root)/$REPOPATH

    rm -rf $TMPREPODIR
}

alias ghn=ghq-new

# Search unused files in git project.
# Web開発で不要になったファイルの探索に使用する。
# @pattern 対象ファイルパスをpatternで指定する
function git-check-unrefs-files() {
  local pattern files
  pattern=$1
  files=$(git ls-files | grep "$pattern")

  for file in $files
  do
    if ! git grep --name-only $(basename $file); then
      echo $file
    fi
  done
}
alias gcuf=git-check-unrefs-files

# goto dotfile dir with tmux
function goto-dotfile-with-tmux() {
  local dir repository session current_session
  dir=$DOTFILES

  if [[ ! -d $dir ]]; then
    echo "Not found $dir"
    return
  fi

  switch_or_create_tmux_session "$dir"
}
alias gdot=goto-dotfile-with-tmux

# pnpm
alias pn=pnpm