"*********************************************************************
" https://github.com/scrooloose/nerdtree
"*********************************************************************

let NERDTreeIgnore = get(g:, 'NERDTreeIgnore', [
      \ '\.git$',
      \ '\.pyc$',
      \ '__pycache__',
      \ 'node_modules',
      \ ])
let NERDTreeMapJumpNextSibling = get(g:, 'NERDTreeMapJumpNextSibling', '<C-n>')
let NERDTreeMapJumpPrevSibling = get(g:, 'NERDTreeMapJumpPrevSibling', '<C-p>')
let NERDTreeCaseSensitiveSort = get(g:, 'NERDTreeCaseSensitiveSort', 1)

Plug 'scrooloose/nerdtree'

nnoremap <Leader>nj :NERDTreeFind<CR>
nnoremap <Leader>nn :NERDTreeFocus<CR>
nnoremap <Leader>tn :NERDTreeToggle<CR>
