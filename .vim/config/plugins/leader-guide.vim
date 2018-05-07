"*********************************************************************
" hecal3/vim-leader-guide
"*********************************************************************

Plug 'hecal3/vim-leader-guide'

function! s:leader_guide_display_func()
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '#', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<SID>', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, ':call ', '', '')
endfunction

if exists('g:leaderGuide_displayfunc')
  call add(g:leaderGuide_displayfunc, function('s:leader_guide_display_func'))
else
  let g:leaderGuide_displayfunc = [function('s:leader_guide_display_func')]
endif

map <Leader>. <Plug>leaderguide-global
map <LocalLeader>. <Plug>leaderguide-buffer

nnoremap <silent> <Leader> :LeaderGuide mapleader<CR>
vnoremap <silent> <Leader> :LeaderGuideVisual mapleader<CR>
nnoremap <silent> <LocalLeader> :LeaderGuide  maplocalleader<CR>
vnoremap <silent> <LocalLeader> :LeaderGuideVisual  maplocalleader<CR>
