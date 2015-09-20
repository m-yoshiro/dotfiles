.bash_profile
export PATH=$PATH:/Applications/eclipse/android/platform-tools
PATH=/opt/local/bin:/opt/local/sbin:$PATH
MANPATH=/opt/local/man:$MANPATH

# MySQL Path Setting
export PATH=$PATH:/Applications/XAMPP/xamppfiles/bin

export PATH=$HOME/.nodebrew/current/bin:$PATH

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi 
alias brew="env PATH=${PATH/\/Users\/tasukujp\/\.pyenv\/shims:/} brew"
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# export PYENV_ROOT=/usr/local/opt/pyenv
