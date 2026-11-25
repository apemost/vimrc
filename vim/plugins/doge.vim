"*********************************************************************
" https://github.com/kkoomen/vim-doge
"*********************************************************************

let g:doge_doc_standard_python = get(g:, 'doge_doc_standard_python', 'numpy')
let g:doge_mapping = get(g:, 'doge_mapping', '<Leader>dg')

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install({ 'headless': 1 }) } }
