"*********************************************************************
" https://github.com/plasticboy/vim-markdown
"*********************************************************************

let g:vim_markdown_folding_disabled = get(g:, 'vim_markdown_folding_disabled', 1)
let g:vim_markdown_toc_autofit = get(g:, 'vim_markdown_toc_autofit', 1)
let g:vim_markdown_new_list_item_indent = get(g:, 'vim_markdown_new_list_item_indent', 2)

Plug 'plasticboy/vim-markdown'

nnoremap <Leader>at :TableFormat<CR>

"*********************************************************************
" https://github.com/mzlogin/vim-markdown-toc
"*********************************************************************

let g:vmt_auto_update_on_save = get(g:, 'vmt_auto_update_on_save', 1)
let g:vmt_list_item_char = get(g:, 'vmt_list_item_char', '-')
let g:vmt_fence_text = get(g:, 'vmt_fence_text', 'TOC')
let g:vmt_fence_closing_text = get(g:, 'vmt_fence_closing_text', '/TOC')

Plug 'mzlogin/vim-markdown-toc'

"*********************************************************************
" https://github.com/JamshedVesuna/vim-markdown-preview
"*********************************************************************

if v:version < 801
  let vim_markdown_preview_hotkey = get(g:, 'vim_markdown_preview_hotkey', '<C-m>')
  let vim_markdown_preview_browser = get(g:, 'vim_markdown_preview_browser', 'Google Chrome')
  if executable('grip')
    let vim_markdown_preview_github = get(g:, 'vim_markdown_preview_github', 1)
  endif

  Plug 'JamshedVesuna/vim-markdown-preview'
endif

"*********************************************************************
" https://github.com/iamcco/markdown-preview.nvim
"*********************************************************************

if v:version >= 801
  let g:mkdp_auto_start = get(g:, 'mkdp_auto_start', 0)
  let g:mkdp_auto_close = get(g:, 'mkdp_auto_close', 1)
  let g:mkdp_refresh_slow = get(g:, 'mkdp_refresh_slow', 0)
  let g:mkdp_command_for_global = get(g:, 'mkdp_command_for_global', 0)
  let g:mkdp_open_to_the_world = get(g:, 'mkdp_open_to_the_world', 0)
  let g:mkdp_open_ip = get(g:, 'mkdp_open_ip', '')
  let g:mkdp_browser = get(g:, 'mkdp_browser', '')
  let g:mkdp_echo_preview_url = get(g:, 'mkdp_echo_preview_url', 0)
  let g:mkdp_browserfunc = get(g:, 'mkdp_browserfunc', '')

  " options for markdown render
  " mkit: markdown-it options for render
  " katex: katex options for math
  " uml: markdown-it-plantuml options
  " maid: mermaid options
  " disable_sync_scroll: if disable sync scroll, default 0
  " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
  "   middle: mean the cursor position alway show at the middle of the preview page
  "   top: mean the vim top viewport alway show at the top of the preview page
  "   relative: mean the cursor position alway show at the relative positon of the preview page
  " hide_yaml_meta: if hide yaml metadata, default is 1
  " sequence_diagrams: js-sequence-diagrams options
  let g:mkdp_preview_options = {
        \   'mkit': {},
        \   'katex': {},
        \   'uml': {},
        \   'maid': {},
        \   'disable_sync_scroll': 0,
        \   'sync_scroll_type': 'middle',
        \   'hide_yaml_meta': 1,
        \   'sequence_diagrams': {}
        \ }
  let g:mkdp_markdown_css = get(g:, 'mkdp_markdown_css', '')
  let g:mkdp_highlight_css = get(g:, 'mkdp_highlight_css', '')
  let g:mkdp_port = get(g:, 'mkdp_port', '')

  " preview page title
  " ${name} will be replace with the file name
  let g:mkdp_page_title = get(g:, 'mkdp_page_title', '${name}')

  Plug 'iamcco/markdown-preview.nvim', {'do': {-> mkdp#util#install()}}

  nnoremap <Leader>pm :MarkdownPreview<CR>
endif
