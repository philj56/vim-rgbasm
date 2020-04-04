" Vim filetype plugin file
" Language:	RGBASM
" Maintainer:	Phil Jones <philj56@gmail.com>
" Last Change:	2020 Apr 04

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetAsmIndent()
setlocal indentkeys=<:>,!^F,o,O

if exists("*GetAsmIndent")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

function s:buffer_shiftwidth()
  return shiftwidth()
endfunction

function! GetAsmIndent()
  let line = getline(v:lnum)
  let ind = s:buffer_shiftwidth()

  " For comments, just return previous indent
  if line =~ '^;'
	  return -1
  endif
  " Don't indent when line is a:
  if line =~ '^\s*\k\+:'
    " Label (starts with ':' terminated keyword)
    let ind = 0
  elseif line =~ '^\s*\.\k\+'
    " Local Label (starts with '.')
    let ind = 0
  elseif line =~ '^\s*\<\u\+\>.*'
    " RGBASM command (all caps word)
    let ind = 0
  endif

  return ind
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
