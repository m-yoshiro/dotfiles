scriptencoding utf-8
" 補完をインサートモードのみに限定
let g:user_emmet_mode='inv'
let g:user_emmet_complete_tag = 1
let g:user_emmet_settings = {
  \ 'variables' : {
  \   'lang' : 'ja',
  \ },
  \ 'custom_expands1' : {
  \   '^\%(lorem\|lipsum\)\(\d*\)$' : function('emmet#lorem#ja#expand')
  \ }
  \}
