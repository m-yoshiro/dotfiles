scriptencoding utf-8
let $PATH=$PATH.'path_to_compass'

" 編集したファイルから遡るフォルダの最大数
let g:sass_compile_cdloop = 5

" ファイル保存時に自動コンパイル（1で自動実行）
let g:sass_compile_auto = 1

" 自動コンパイルを実行する拡張子
let g:sass_compile_file = ['scss', 'sass']

" cssファイルが入っているディレクトリ名（前のディレクトリほど優先）
let g:sass_compile_cssdir = ['css', 'stylesheet', 'stylesheets']

" コンパイル実行前に実行したいコマンドを設定
" 例：growlnotifyによる通知
" let g:sass_compile_beforecmd = "growlnotify -t 'sass-compile.vim' -m 'start sass compile.'"
let g:sass_compile_beforecmd = ''

" コンパイル実行後に実行したいコマンドを設定
" 例：growlnotifyによる通知(${sasscompileresult}は実行結果)
" let g:sass_compile_aftercmd = "growlnotify -t 'sass-compile.vim' -m ${sasscompileresult}"
let g:sass_compile_aftercmd = ''
