"*********************************************************************
" Initialization
"*********************************************************************

" Enable nocompatible
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
endif

let s:dirname = fnamemodify(expand('<sfile>'), ':h')
let s:scripts = [
      \   '/config/general.vim',
      \   '/config/appearance.vim',
      \   '/config/plugins.vim',
      \   '/config/keymap.vim',
      \ ]

execute 'source' fnameescape(s:dirname . '/functions.vim')

function! s:init()
  for filename in s:scripts
    call TrySource(s:dirname . filename)
  endfor
endfunction

call s:init()
