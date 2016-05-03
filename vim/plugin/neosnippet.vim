imap <silent><C-k>   <Plug>(neosnippet_expand_or_jump)
smap <silent><expr>K   <Plug>(neosnippet_expand_or_jump)
imap <silent><expr>G   pumvisible() ? "\<Plug>(neosnippet_expand)" : "G"
xmap <silent><expr>o   <Plug>(neosnippet_register_oneshot_snippet)

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_complete_done = 1
let g:neosnippet#expand_word_boundary = 1

let g:neosnippet#snippets_directory = 'dein#get_direct_plugins_path("vim-snippets")'
inoremap <silent> (( <C-r>=neosnippet#anonymous('\left(${1}\right)${0}')<CR>
