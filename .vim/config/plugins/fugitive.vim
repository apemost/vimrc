"*********************************************************************
" tpope/vim-fugitive
"*********************************************************************

Plug 'tpope/vim-fugitive'

nnoremap <Leader>gb :Gblame<CR>
vnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<Space>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<Space>
nnoremap <Leader>gf :Gfetch<Space>
nnoremap <Leader>gl :Gpull<Space>
nnoremap <Leader>gm :Gmerge<Space>
nnoremap <Leader>gp :Gpush<Space>
nnoremap <Leader>gr :Gread<Space>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<Space>

"*********************************************************************
" junegunn/gv.vim
"*********************************************************************

Plug 'junegunn/gv.vim'

nnoremap <Leader>gv :GV!<CR>
vnoremap <Leader>gv :GV!<CR>
