"*********************************************************************
" https://github.com/mbbill/undotree
"*********************************************************************
let g:undotree_WindowLayout = get(g:, 'undotree_WindowLayout', 4)

Plug 'mbbill/undotree'

nnoremap <Leader>tu :TagbarClose<CR>:UndotreeToggle<CR>
