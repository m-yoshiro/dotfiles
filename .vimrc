" Plugin
source ~/dotfiles/.vimrc.bundle

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
source ~/dotfiles/.vimrc.plugin_setting

" ------------------
" #ColorScheme
" ------------------

syntax on
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

" -------------------
" 全角スペースを表示する
" " http://inari.hatenablog.com/entry/2014/05/05/231307
" -------------------
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()

endif
" -----------------

