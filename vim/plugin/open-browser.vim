" ====================
" open-browser.vim
" ====================

let g:openbrowser_search_engines = {
    \   'caniuse': 'http://caniuse.com/#search={query}',
    \}
let g:netrw_nogx = 1
let g:openbrowser_open_filepath_in_vim = 0
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
command! OpenBrowserCurrent execute "OpenBrowser" "file://" . expand('%:p:gs?\\?/?')
command! CanIuse execute ":OpenBrowserSmartSearch" "-caniuse" input('Can I use?: ')
