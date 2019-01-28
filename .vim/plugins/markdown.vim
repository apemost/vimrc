"*********************************************************************
" plasticboy/vim-markdown
"*********************************************************************

let g:vim_markdown_folding_disabled = get(g:, 'vim_markdown_folding_disabled', 1)
let g:vim_markdown_toc_autofit = get(g:, 'vim_markdown_toc_autofit', 1)
let g:vim_markdown_new_list_item_indent = get(g:, 'vim_markdown_new_list_item_indent', 2)

Plug 'plasticboy/vim-markdown'

nnoremap <Leader>at :TableFormat<CR>

"*********************************************************************
" JamshedVesuna/vim-markdown-preview
"*********************************************************************

let vim_markdown_preview_hotkey = get(g:, 'vim_markdown_preview_hotkey', '<C-m>')
let vim_markdown_preview_browser = get(g:, 'vim_markdown_preview_browser', 'Google Chrome')
if executable('grip')
  let vim_markdown_preview_github = get(g:, 'vim_markdown_preview_github', 1)
endif

Plug 'JamshedVesuna/vim-markdown-preview'
