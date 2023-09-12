augroup my_filetypedetect
  au BufRead,BufNewFile *.{k,}{ev,}l{e,}x setlocal ft=kevlex
  au BufRead,BufNewFile *.{k,}{ev,}lr setlocal ft=kevlr
augroup END
