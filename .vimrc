" ====================
" # Plugin
" ====================
" neobundle settings {{{
  if has('vim_starting')
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
      echo "Test install neobundle..."
      :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif
  call neobundle#begin(expand('~/.vim/bundle/'))
  let g:neobundle#types#git#default_protocol = 'https'

  if neobundle#load_cache()

  NeoBundleFetch 'Shougo/neobundle.vim'

  " vimproc
  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

  call neobundle#load_toml('~/dotfiles/neobundle.toml')
  call neobundle#load_toml('~/dotfiles/neobundle_lazy.toml', {'lazy' :1})

  NeoBundleSaveCache
endif

call neobundle#end()

filetype plugin indent on
NeoBundleCheck


" ====================
" # Include .vimrc.~
" ====================

" Basic setting
source ~/dotfiles/.vimrc.basic

" Edit
source ~/dotfiles/.vimrc.editing

" Indent
source ~/dotfiles/.vimrc.indent

" Moving
source ~/dotfiles/.vimrc.moving

" Completion
source ~/dotfiles/.vimrc.completion

"Plugin setting
source ~/dotfiles/.vimrc.plugin

"Local setting
source ~/dotfiles/.vimrc.local

augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand("<afile>:p:h"))
augroup END

function! s:vimrc_local(loc) abort
  let files = findfile(".vimrc", escape(a:lock, " ") . ";", -1)
  for i in reverse(filter(files, "filereadable(v:val)"))
    source `=i`
  endfor
endfunction

