"*********************************************************************
" https://github.com/tpope/vim-fugitive
"*********************************************************************

Plug 'tpope/vim-fugitive'

nnoremap <Leader>gb :Git blame<CR>
vnoremap <Leader>gb :Git blame<CR>
nnoremap <expr> <Leader>gc (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Git commit\<Space>"
nnoremap <Leader>gD :Gdiff<Space>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<Space>
nnoremap <Leader>gf :Git fetch<Space>
nnoremap <Leader>gl :Git pull<Space>
nnoremap <Leader>gm :Git merge<Space>
nnoremap <Leader>gp :Git push<Space>
nnoremap <Leader>gr :Gread<Space>
nnoremap <expr> <Leader>gs (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Git\<CR>"
nnoremap <Leader>gw :Gwrite<Space>
