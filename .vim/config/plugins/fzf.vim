"*********************************************************************
" junegunn/fzf
"*********************************************************************

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}

"*********************************************************************
" junegunn/fzf.vim
"*********************************************************************

Plug 'junegunn/fzf.vim'

let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--color=always --format="%C(auto)%h%d %s %C(green)%C(bold)%cr"'
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
command! -bang -nargs=* Gg
      \ call fzf#vim#grep(
      \   'git grep --line-number --color=always '.shellescape(<q-args>), 0,
      \   extend(
      \     {'dir': systemlist('git rev-parse --show-toplevel')[0]},
      \     <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   ), <bang>0)
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nmap <Leader><Tab> <Plug>(fzf-maps-n)
xmap <Leader><Tab> <Plug>(fzf-maps-x)
omap <Leader><Tab> <Plug>(fzf-maps-o)

nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bc :BCommits<CR>

nnoremap <Leader>f/ :History/<CR>
nnoremap <Leader>f: :History:<CR>
nnoremap <Leader>fa :Ag<Space><C-r><C-w><CR>
nnoremap <Leader>fc :Commands<CR>
nnoremap <expr> <Leader>ff (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Files\<CR>"
nnoremap <Leader>fg :Gg<Space><C-r><C-w><CR>
nnoremap <expr> <Leader>fh (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":History\<CR>"
nnoremap <Leader>fm :Marks<CR>
nnoremap <Leader>fr :Rg<Space><C-r><C-w><CR>
nnoremap <expr> <Leader>fs (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":GFiles?\<CR>"
nnoremap <Leader>fu :Snippets<CR>

nnoremap <expr> <Leader>gg (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":GFiles\<CR>"
nnoremap <Leader>gh :Commits<CR>

nnoremap <Leader>sa :Ag<Space>
nnoremap <Leader>sg :Gg<Space>
nnoremap <Leader>sr :Rg<Space>
