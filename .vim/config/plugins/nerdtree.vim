"*********************************************************************
" scrooloose/nerdtree
"*********************************************************************

let NERDTreeIgnore = ['\.git$', '\.pyc$', '__pycache__', 'node_modules']
let NERDTreeMapJumpNextSibling = get(g:, 'NERDTreeMapJumpNextSibling', '<C-n>')
let NERDTreeMapJumpPrevSibling = get(g:, 'NERDTreeMapJumpPrevSibling', '<C-p>')

Plug 'scrooloose/nerdtree'

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

nnoremap <Leader>tf :NERDTreeFind<CR>
nnoremap <Leader>tj :NERDTreeFocus<CR>
nnoremap <Leader>tn :NERDTreeToggle<CR>
