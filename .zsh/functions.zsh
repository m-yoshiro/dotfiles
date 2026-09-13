# --- Herdr ----------

# Open a directory as a Herdr workspace when running inside Herdr. Outside
# Herdr, change to the selected directory in the current shell.
function herdr_switch_directory() {
  local dir tail_path workspace_id workspaces

  dir=$(cd -- "$1" && pwd -P) || return 1

  if [[ -z ${HERDR_ENV:-} ]]; then
    cd "$dir"
    return
  fi

  workspaces=$(herdr workspace list) || return 1
  workspace_id=$(printf '%s\n' "$workspaces" \
    | jq -r --arg cwd "$dir" \
      '.result.workspaces[]? | select(.cwd == $cwd) | .workspace_id' \
    | head -n 1)

  if [[ -n $workspace_id && $workspace_id != "null" ]]; then
    herdr workspace focus "$workspace_id"
    return
  fi

  # Use the final two path components for a concise workspace label.
  tail_path=${dir:h:t}/${dir:t}
  herdr workspace create --cwd "$dir" --label "${tail_path//./-}" --focus
}

function herdr_select_git_repo() {
  local dir
  dir=$(ghq root)/$(ghq list | fzf --prompt 'GIT REPO>')

  if [[ $dir != "$(ghq root)/" ]]; then
    herdr_switch_directory "$dir"
  fi
}

function herdr_select_work() {
  local dir
  dir=$HOME/Works/$(ls $HOME/Works | fzf --prompt 'WORK>')

  if [[ ! -d $dir ]]; then
    echo "Not found $dir"
    return
  fi

  herdr_switch_directory "$dir"
}

function herdr_select_dotfile() {
  local dir
  dir=$DOTFILES

  if [[ ! -d $dir ]]; then
    echo "Not found $dir"
    return
  fi

  herdr_switch_directory "$dir"
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

export WORKTREE_DIR=$HOME/.worktrees
function git_worktree_add() {
  repo=$(basename "$(git rev-parse --show-toplevel)")

  # ★2. ブランチ名を決定
  #    - $1 が渡されていればそれを使う
  #    - 省略時は現在チェックアウト中のブランチ名を自動取得
  branch=${1:-$(git rev-parse --abbrev-ref HEAD)}

  # ★3. / や : を - に置換して安全なディレクトリ名に
  safe_branch=$(echo "$branch" | tr '/:' '-')

  # ★4. worktree を追加
  git worktree add -b "$branch" "$WORKTREE_DIR/${repo}-${safe_branch}"
}

wtree_select() {
  git worktree list | sort -u | fzf --prompt "WORKTREES>" | awk '{print $1}'
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
