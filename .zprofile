.bash_profile
export PATH=$PATH:/Applications/eclipse/android/platform-tools
PATH=/opt/local/bin:/opt/local/sbin:$PATH
MANPATH=/opt/local/man:$MANPATH

# MySQL Path Setting
export PATH=$PATH:/Applications/XAMPP/xamppfiles/bin

export PATH=$HOME/.nodebrew/current/bin:$PATH

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
 export PATH=${PYENV_ROOT}/bin:$PATH
 eval "$(pyenv init -)"
fi
