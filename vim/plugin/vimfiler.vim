" ====================
" vimfiler.vim
" ====================

"IDE風
noremap <silent> [vimfiler]t :<C-u>VimFilerBufferDir -winwidth=35 -split -no-quit -simple -toggle<CR>

"デフォルトのfilerに設定
let g:vimfiler_as_default_explorer = 1
"セーフモード無効で起動
let g:vimfiler_safe_mode_by_default = 0
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = '⋮'
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" 現在のディレクトリ
nnoremap <silent> [vimfiler]e :<C-u>VimFilerBufferDir -quit<CR>

"vimfiler上でのキーマッピング
augroup vimfiller_setting
  autocmd!
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
  nnoremap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
  nmap <buffer> <C-q> <Plug>(vimfiler_quick_look)
  nmap <buffer> <C-w> <Plug>(vimfiler_switch_to_history_directory)
  setlocal nonumber
endfunction
