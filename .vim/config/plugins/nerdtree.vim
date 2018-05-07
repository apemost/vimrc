"*********************************************************************
" scrooloose/nerdtree
"*********************************************************************

Plug 'scrooloose/nerdtree'

let NERDTreeIgnore = ['\.git$', '\.pyc$', '__pycache__', 'node_modules']
let NERDTreeMapJumpNextSibling = '<C-n>'
let NERDTreeMapJumpPrevSibling = '<C-p>'

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

nnoremap <Leader>tf :UndotreeHide<CR>:NERDTreeFind<CR>
nnoremap <Leader>tj :UndotreeHide<CR>:NERDTreeFocus<CR>
nnoremap <Leader>tn :UndotreeHide<CR>:NERDTreeToggle<CR>
