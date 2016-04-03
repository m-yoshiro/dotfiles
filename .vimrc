" ====================
" # Initialize
" ====================
if &compatible
  set nocompatible
endif

let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

" dein.vim settings {{{
" Load dein.
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand('$CACHE/dein')
          \. '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute ' set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

source ~/dotfiles/vim/.vimrc.dein


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
