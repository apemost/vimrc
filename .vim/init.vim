"*********************************************************************
" Initialization
"*********************************************************************

let s:dirname = fnamemodify(expand('<sfile>'), ':h')
let s:scripts = [
      \   '/config/variables.vim',
      \   '/config/general.vim',
      \   '/config/plugins/init.vim',
      \   '/config/keymap.vim',
      \   '/config/appearance.vim',
      \ ]

execute 'source' fnameescape(s:dirname . '/functions.vim')

function! s:init()
  for filename in s:scripts
    call TrySource(s:dirname . filename)
  endfor
endfunction

call s:init()
