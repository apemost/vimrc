"*********************************************************************
" https://github.com/airblade/vim-gitgutter
"*********************************************************************

let g:gitgutter_map_keys = get(g:, 'gitgutter_map_keys', 0)

Plug 'airblade/vim-gitgutter'

nmap <silent> ]h :GitGutterNextHunk<CR>
nmap <silent> [h :GitGutterPrevHunk<CR>

" Hunk actions, aligned with the nvim gitsigns.lua <Leader>h* mappings.
nmap <silent> <Leader>hs <Plug>(GitGutterStageHunk)
xmap <silent> <Leader>hs <Plug>(GitGutterStageHunk)
nmap <silent> <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <silent> <Leader>hp <Plug>(GitGutterPreviewHunk)

" Inner-hunk text object for operator-pending and visual modes.
omap <silent> ih <Plug>(GitGutterTextObjectInnerPending)
xmap <silent> ih <Plug>(GitGutterTextObjectInnerVisual)
