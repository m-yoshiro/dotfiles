# Dotfiles
## Install
```
git clone git@github.com:m-yoshiro/dotfiles.git ~/dotfiles

cd ~/dotfiles
bash bootstrap
```

`bootstrap` links each tracked `.config` file individually, so unrelated
application configuration and runtime state already present in `~/.config` are
preserved.
