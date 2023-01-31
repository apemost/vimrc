"*********************************************************************
" Keymap
"*********************************************************************

" Make Y behave like other capitals
nnoremap Y y$

nmap <silent> ]b :bnext<CR>
nmap <silent> [b :bprevious<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>
inoremap <C-n> <Down>
inoremap <C-p> <Up>

" Save as superuser
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>
" Yank full path of current buffer
nnoremap <silent> <Leader>yf :let @+ = expand("%:p")<CR>
" Yank relative path of current buffer
nnoremap <silent> <Leader>yn :let @+ = expand("%")<CR>

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
autocmd FileType qf nnoremap <buffer> q :q<CR>
