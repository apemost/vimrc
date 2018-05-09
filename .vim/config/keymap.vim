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

nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>

nnoremap <Leader>wo :copen<CR>
nnoremap <Leader>wx :cclose<CR>

function! s:internet_search(q)
  let url = get(g:, 'custom_search_engine', 'https://www.google.com/search?q=%s')
  let q = substitute(a:q, '["\n]', ' ', 'g')
  let q = substitute(q, '[[:punct:] ]', '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  let open = IsLinux() ? 'xdg-open' : 'open'
  call system(printf(open . ' "' . url . '"', q))
endfunction

nnoremap <silent> <Leader>se :call <SID>internet_search(expand('<cWORD>'))<CR>
xnoremap <silent> <Leader>se "gy:call <SID>internet_search(@g)<CR>

autocmd FileType help nnoremap <buffer> q :q<CR>
