"*********************************************************************
" tpope/vim-fugitive
"*********************************************************************

Plug 'tpope/vim-fugitive'

nnoremap <Leader>gb :Gblame<CR>
vnoremap <Leader>gb :Gblame<CR>
nnoremap <expr> <Leader>gc (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Gcommit\<Space>"
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<Space>
nnoremap <Leader>gf :Gfetch<Space>
nnoremap <Leader>gl :Gpull<Space>
nnoremap <Leader>gm :Gmerge<Space>
nnoremap <Leader>gp :Gpush<Space>
nnoremap <Leader>gr :Gread<Space>
nnoremap <expr> <Leader>gs (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Gstatus\<CR>"
nnoremap <Leader>gw :Gwrite<Space>
