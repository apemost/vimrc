"*********************************************************************
" https://github.com/moll/vim-bbye
"*********************************************************************

Plug 'moll/vim-bbye'

" Unload current buffer and delete it from buffer list
nnoremap <Leader>bd :Bdelete<CR>
" Like `:Bdelete`, but really delete the buffer
nnoremap <Leader>bw :Bwipeout<CR>
