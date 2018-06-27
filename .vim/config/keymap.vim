"*********************************************************************
" Keymap
"*********************************************************************

" Make Y behave like other capitals
nnoremap Y y$

nmap <silent> ]b :bnext<CR>
nmap <silent> [b :bprevious<CR>

nmap <silent> ]t :tabnext<CR>
nmap <silent> [t :tabprevious<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>

nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>

nnoremap <expr> <Leader>tb (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":buffer#\<CR>"

function! s:toggle_quickfix()
  if exists("g:quickfix_win")
    cclose
    unlet g:quickfix_win
  else
    copen
    let g:quickfix_win = bufnr('$')
  endif
endfunction

nnoremap <silent> <Leader>tw :call <SID>toggle_quickfix()<CR>

function! s:internet_search(q)
  let url = g:custom_search_engine
  let q = substitute(a:q, '["\n]', ' ', 'g')
  let q = substitute(q, '[[:punct:] ]', '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  let open = IsLinux() ? 'xdg-open' : 'open'
  call system(printf(open . ' "' . url . '"', q))
endfunction

nnoremap <silent> <Leader>se :call <SID>internet_search(expand('<cWORD>'))<CR>
xnoremap <silent> <Leader>se "gy:call <SID>internet_search(@g)<CR>

autocmd FileType help nnoremap <buffer> q :q<CR>
