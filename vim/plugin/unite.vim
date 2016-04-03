" ====================
" unite.vim
" ====================

let g:unite_source_file_mru_limit=200
let g:unite_source_rec_async_command='pt --nocolor --nogroup -g .'
let g:unite_source_rec_max_cache_files=5000
let g:neoyank#limit = 1000
let g:neoyank#file = $HOME.'/.vim/yankring.txt'

call unite#custom#source(
      \ 'buffer,file_rec/async,file_rec', 'matchers',
      \ ['converter_tail', 'matcher_default'])
call unite#custom#source(
      \ 'file_rec/async,file_rec', 'converters',
      \ ['converter_file_directory'])

call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_grep_max_candidates = 200

" unite grepにpt を使う
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" snippet一覧
" nnoremap <silent> [unite]s :<C-u>Unite snippet<CR>