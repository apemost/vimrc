"*********************************************************************
" https://github.com/junegunn/gv.vim
"*********************************************************************

Plug 'junegunn/gv.vim'

" Open commit browser
nnoremap <Leader>gV :GV<Space>
" List commits that affected the current file
nnoremap <Leader>gv :GV!<CR>
vnoremap <Leader>gv :GV!<CR>
