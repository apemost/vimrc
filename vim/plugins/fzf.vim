"*********************************************************************
" https://github.com/junegunn/fzf
"*********************************************************************

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': { -> fzf#install() }}

"*********************************************************************
" https://github.com/junegunn/fzf.vim
"*********************************************************************

let g:fzf_buffers_jump = get(g:, 'fzf_buffers_jump', 1)
let g:fzf_commits_log_options =
      \ get(g:, 'fzf_commits_log_options', '--color=always --format="%C(auto)%h%d %s %C(green)%C(bold)%cr"')

Plug 'junegunn/fzf.vim'

command! -bang -nargs=* GG
      \ call fzf#vim#grep(
      \   'git grep --line-number --color=always ' . <q-args>, 0,
      \   extend(
      \     {'dir': systemlist('git rev-parse --show-toplevel')[0]},
      \     <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   ), <bang>0)
command! -bang -nargs=* RG
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always ' . <q-args>, 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
command! -bang -nargs=* Gg
      \ call fzf#vim#grep(
      \   'git grep --line-number --ignore-case --color=always ' . shellescape(<q-args>), 0,
      \   extend(
      \     {'dir': systemlist('git rev-parse --show-toplevel')[0]},
      \     <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   ), <bang>0)
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --ignore-case --no-heading --color=always ' . shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nmap <Leader><Tab> <Plug>(fzf-maps-n)
xmap <Leader><Tab> <Plug>(fzf-maps-x)
omap <Leader><Tab> <Plug>(fzf-maps-o)

nnoremap <expr> <Leader>bb (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Buffers\<CR>"
nnoremap <Leader>bh :BCommits<CR>
vnoremap <Leader>bh :BCommits<CR>

nnoremap <Leader>f/ :History/<CR>
nnoremap <Leader>f: :History:<CR>
nnoremap <Leader>fa :Ag<Space><C-r><C-w><CR>
vnoremap <Leader>fa "gy:Ag<Space><C-r>g<CR>
nnoremap <Leader>fc :Commands<CR>
nnoremap <expr> <Leader>ff (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Files\<CR>"
nnoremap <Leader>fg :Gg<Space><C-r><C-w><CR>
vnoremap <Leader>fg "gy:Gg<Space><C-r>g<CR>
nnoremap <expr> <Leader>fh (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":History\<CR>"
nnoremap <Leader>fm :Marks<CR>
nnoremap <Leader>fr :Rg<Space><C-r><C-w><CR>
vnoremap <Leader>fr "gy:Rg<Space><C-r>g<CR>
nnoremap <expr> <Leader>fs (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":GFiles?\<CR>"
nnoremap <Leader>fu :Snippets<CR>
nnoremap <Leader>fw :Windows<CR>
nnoremap <expr> <Leader>fz (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":FZF\<Space>"

nnoremap <expr> <Leader>gg (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":GFiles\<CR>"
nnoremap <Leader>gh :Commits<CR>

nnoremap <expr> <Leader>sG (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":GG\<Space>"
nnoremap <expr> <Leader>sR (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":RG\<Space>"
nnoremap <expr> <Leader>sa (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Ag\<Space>"
nnoremap <expr> <Leader>sg (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Gg\<Space>"
nnoremap <expr> <Leader>sr (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Rg\<Space>"
