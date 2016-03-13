" ====================
" # Initialize
" ====================
if &compatible
  set nocompatible
endif

" dein.vim settings {{{
" installed dir
let s:dein_dir = expand('~/.vim/dein')
" dein.vim path
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

function! s:source_rc(path) abort
  execute 'source' fnameescape(expand('~/dotfiles/vim/' . a:path))
endfunction

 " install dein.vim
if &runtimepath !~# '/dein.bim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" start dein
call dein#begin(s:dein_dir)

" Plugin lists
let s:toml = '~/dotfiles/vim/plugin.toml'
let s:lazy_toml = '~/dotfiles/vim/plugin_lazy.toml'

" Cashe TOML
if dein#load_cache([expand('<sfile>'), s:toml, s:lazy_toml])
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#save_cache()
endif

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" ====================
" # Include .vimrc.~
" ====================

if has('nvim')
  source ~/dotfiles/vim/.nvimrc
endif

" Basic setting
source ~/dotfiles/vim/.vimrc.basic

" Edit
source ~/dotfiles/vim/.vimrc.editing

" Indent
source ~/dotfiles/vim/.vimrc.indent

" Moving
source ~/dotfiles/vim/.vimrc.moving

source ~/dotfiles/vim/.vimrc.completion

source ~/dotfiles/vim/.vimrc.plugin
"Local setting
source ~/dotfiles/vim/.vimrc.local
