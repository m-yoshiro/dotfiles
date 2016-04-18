imap <silent><expr>S   pumvisible() ? "\<Plug>(neosnippet_jump_or_expand)" : "S"
smap <silent><expr>L   <Plug>(neosnippet_jump_or_expand)
xmap <silent><expr>L   <Plug>(neosnippet_expand_target)
imap <silent><C-k>   <Plug>(neosnippet_expand_or_jump)
smap <silent><expr>K   <Plug>(neosnippet_expand_or_jump)
imap <silent><expr>G   pumvisible() ? "\<Plug>(neosnippet_expand)" : "G"
xmap <silent><expr>o   <Plug>(neosnippet_register_oneshot_snippet)

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_complete_done = 1
let g:neosnippet#expand_word_boundary = 1


" let g:snippets_dir = '~/.vim/snippets/,~/.vim/bundle/snipmate/snippets/'
let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets, ~/.vim/bundle/snipmate-nodejs'
inoremap <silent> (( <C-r>=neosnippet#anonymous('\left(${1}\right)${0}')<CR>
