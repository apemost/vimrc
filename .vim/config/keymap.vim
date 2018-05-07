"*********************************************************************
" Keymap
"*********************************************************************

" Make Y behave like other capitals
nnoremap Y y$

nmap <silent> <C-n> :bnext<CR>
nmap <silent> <C-p> :bprevious<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>

nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>

nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>

nnoremap <Leader>wo :copen<CR>
nnoremap <Leader>wx :cclose<CR>

function! s:search_engine(q)
  let url = get(g:, 'custom_search_engine', 'https://www.google.com/search?q=%s')
  let q = substitute(a:q, '["\n]', ' ', 'g')
  let q = substitute(q, '[[:punct:] ]', '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  let open = IsLinux() ? 'xdg-open' : 'open'
  call system(printf(open . ' "' . url . '"', q))
endfunction

nnoremap <silent> <Leader>se :call <SID>search_engine(expand('<cWORD>'))<CR>
xnoremap <silent> <Leader>se "gy:call <SID>search_engine(@g)<CR>
