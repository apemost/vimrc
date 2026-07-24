"*********************************************************************
" https://github.com/scrooloose/nerdtree
"*********************************************************************

let NERDTreeIgnore = get(g:, 'NERDTreeIgnore', [
      \ '\.DS_Store$',
      \ '\.git$',
      \ '\.pyc$',
      \ '__pycache__',
      \ 'node_modules',
      \ ])
let NERDTreeShowHidden = get(g:, 'NERDTreeShowHidden', 1)
let NERDTreeMapJumpNextSibling = get(g:, 'NERDTreeMapJumpNextSibling', '<C-n>')
let NERDTreeMapJumpPrevSibling = get(g:, 'NERDTreeMapJumpPrevSibling', '<C-p>')
let NERDTreeCaseSensitiveSort = get(g:, 'NERDTreeCaseSensitiveSort', 1)

Plug 'scrooloose/nerdtree'

nnoremap <Leader>nj :NERDTreeFind<CR>
nnoremap <Leader>nn :NERDTreeFocus<CR>
nnoremap <Leader>tn :NERDTreeToggle<CR>

let s:follow_lock = 0

function! s:NERDTreeFollowFile() abort
  if s:follow_lock
    return
  endif
  let l:file = resolve(expand('%:p'))
  if !filereadable(l:file)
    return
  endif
  if !exists('t:NERDTreeBufName') || bufwinnr(t:NERDTreeBufName) == -1
    return
  endif
  let l:cwd = resolve(fnamemodify(getcwd(), ':p'))
  if l:cwd !~# '[/\\]$'
    let l:cwd .= '/'
  endif
  if stridx(l:file, l:cwd) != 0
    return
  endif
  let l:current_winid = win_getid()
  let l:previous_winnr = winnr('#')
  let l:previous_winid = l:previous_winnr > 0
        \ ? win_getid(l:previous_winnr)
        \ : 0
  let s:follow_lock = 1
  try
    NERDTreeFind
  finally
    if win_id2win(l:current_winid) != 0
      call win_gotoid(l:current_winid)
      if l:previous_winid != 0
            \ && l:previous_winid != l:current_winid
            \ && win_id2win(l:previous_winid) != 0
        call win_gotoid(l:previous_winid)
        call win_gotoid(l:current_winid)
      endif
    endif
    let s:follow_lock = 0
  endtry
endfunction

augroup NERDTreeFollowFile
  autocmd!
  autocmd BufEnter * call s:NERDTreeFollowFile()
augroup END
