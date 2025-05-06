# --- Tmux -----------

# Git
function _switch_tmux_session_with_git_repo() {
  local dir repository session current_session
  dir=$1
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

function tmux_select_git_repo() {
  local dir
  dir=$(ghq root)/$(ghq list | fzf --prompt 'GIT REPO>')

  if [[ $dir != "$(ghq root)/" ]]; then
    _switch_tmux_session_with_git_repo "$dir"
  fi
}

# select dotfile
function tmux_select_dotfile() {
  local dir repository session current_session
  dir=$DOTFILES

  if [[ ! -d $dir ]]; then
    echo "Not found $dir"
    return
  fi

  _switch_tmux_session_with_git_repo "$dir"
}

# --- Git -----------

# Search unused files in git project.
# Web開発で不要になったファイルの探索に使用する。
# @pattern 対象ファイルパスをpatternで指定する
function git_check_unrefs_files() {
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

# --- ghq -----------

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