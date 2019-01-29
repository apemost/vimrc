"*********************************************************************
" Autocommands
"*********************************************************************

function! s:CloseWindowsAutomatically()
  if winnr('$') != 1
    return
  endif
  if (&buftype == 'quickfix' || (exists('b:NERDTree') && b:NERDTree.isTabTree()))
    q
  endif
endfunction

augroup CloseWindowsAutomatically
  autocmd!
  autocmd BufEnter * call s:CloseWindowsAutomatically()
augroup END
