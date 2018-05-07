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
let s:scrips = [
      \   '/custom/preload.vim',
      \   '/config/general.vim',
      \   '/config/appearance.vim',
      \   '/config/plugins.vim',
      \   '/config/keymap.vim',
      \   '/custom/afterload.vim',
      \ ]

execute 'source' fnameescape(s:dirname . '/functions.vim')

function! s:init()
  for filename in s:scrips
    call TrySource(s:dirname . filename)
  endfor
endfunction

call s:init()
