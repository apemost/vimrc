"*********************************************************************
" plasticboy/vim-markdown
"*********************************************************************

Plug 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 2

nnoremap <Leader>at :TableFormat<CR>

"*********************************************************************
" JamshedVesuna/vim-markdown-preview
"*********************************************************************

Plug 'JamshedVesuna/vim-markdown-preview'

let vim_markdown_preview_hotkey = '<C-m>'
let vim_markdown_preview_browser = 'Google Chrome'
if executable('grip')
  let vim_markdown_preview_github = 1
endif
