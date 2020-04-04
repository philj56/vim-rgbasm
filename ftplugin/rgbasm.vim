" Vim filetype plugin file
" Language:	RGBASM
" Maintainer:	Phil Jones <philj56@gmail.com>
" Last Change:	2020 Apr 04

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql

" The only comment string is ';'
setlocal comments=:;

set shiftwidth=2
set tabstop=2
set expandtab
