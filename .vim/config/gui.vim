"*********************************************************************
" GUI
"*********************************************************************

" Set GUI font
execute 'set guifont=' . g:custom_guifont

" Hide menu bar
set guioptions-=m

" Hide toolbar
set guioptions-=T

" Hide left-hand scrollbar
set guioptions-=L

" Hide right-hand scrollbar
set guioptions-=r

" Hide bottom scrollbar
set guioptions-=b

" Hide tabline
set showtabline=0

" Hide tab
set guioptions-=e

" Make comments italic
highlight Comment gui=italic

" Enable ligatures on macOS
if IsMac()
  set macligatures
endif
