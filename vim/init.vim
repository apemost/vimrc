"*********************************************************************
" Initialization
"*********************************************************************

let s:dirname = fnamemodify(expand('<sfile>'), ':h')
let s:scripts = [
      \ 'variables.vim',
      \ 'general.vim',
      \ 'plugins/init.vim',
      \ 'keymap.vim',
      \ 'appearance.vim',
      \ 'autocommands.vim',
      \ ]

execute 'source' fnameescape(s:dirname . '/functions.vim')

function! s:init()
  for filename in s:scripts
    call TrySource(s:dirname . '/' . filename)
  endfor
endfunction

call s:init()
