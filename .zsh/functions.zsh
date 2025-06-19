# --- Tmux -----------

# Git
function tmux_switch_directory() {
  local dir tail_path new_session current_session
  dir=$1
  if [[ ! -z ${TMUX} ]]; then
    # convert to "organization/repository"
    tail_path=$(echo $dir | sed -E 's/.*\/(.*\/.*)$/\1/')
    new_session=${tail_path//./-}
    current_session=$(tmux list-sessions | grep 'attached' | cut -d":" -f1)

    # 数値の場合はtmuxのデフォルトセッション番号とみなす
    if [[ $current_session =~ ^[0-9]+$ ]]; then
      cd $dir
      tmux rename-session $new_session
    else
      tmux list-sessions | cut -d":" -f1 | grep $new_session > /dev/null
      if [[ $? != 0 ]]; then
        tmux new-session -d -c $dir -s $new_session
      fi
      tmux switch-client -t $new_session
    fi
  else
    cd $dir
  fi
}

function tmux_select_git_repo() {
  local dir
  dir=$(ghq root)/$(ghq list | fzf --prompt 'GIT REPO>')

  if [[ $dir != "$(ghq root)/" ]]; then
    tmux_switch_directory "$dir"
  fi
}

function tmux_select_work() {
  local dir
  dir=$HOME/Works/$(ls $HOME/Works | fzf --prompt 'WORK>')

  if [[ ! -d $dir ]]; then
    echo "Not found $dir"
    return
  fi

  tmux_switch_directory "$dir"
}

# select dotfile
function tmux_select_dotfile() {
  local dir repository session current_session
  dir=$DOTFILES

  if [[ ! -d $dir ]]; then
    echo "Not found $dir"
    return
  fi

  tmux_switch_directory "$dir"
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

# 特定のworktreeからディレクトリパスを取得
function git_worktree_dir_of() {
  local branch="$1"
  git worktree list --porcelain | awk -v target="refs/heads/$branch" '
    /^worktree / { path = $2 }
    /^branch / && $2 == target { print path }
  '
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