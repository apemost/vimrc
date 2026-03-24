"*********************************************************************
" Functions
"*********************************************************************

function! HasFeatures()
  return has('timers') && exists('*job_start') && exists('*ch_close_in')
endfunction

function! IsLinux()
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction

function! IsMac()
  return has('macunix')
endfunction

function! IsWindows()
  return has('win32') || has('win64')
endfunction

function! TrySource(filepath)
  if filereadable(a:filepath)
    execute 'source' fnameescape(a:filepath)
  endif
endfunction
