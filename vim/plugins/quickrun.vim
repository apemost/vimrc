"*********************************************************************
" https://github.com/thinca/vim-quickrun
"*********************************************************************

let g:quickrun_no_default_key_mappings =
      \ get(g:, 'quickrun_no_default_key_mappings', 1)

Plug 'thinca/vim-quickrun'

silent! map <unique> <Leader>qr <Plug>(quickrun)
