"*********************************************************************
" https://github.com/ekalinin/Dockerfile.vim
"*********************************************************************

Plug 'ekalinin/Dockerfile.vim'

"*********************************************************************
" kevinhui/vim-docker-tools
"*********************************************************************

let g:dockertools_default_all = get(g:, 'dockertools_default_all', 1)
let g:dockertools_sudo_mode  = get(g:, 'dockertools_sudo_mode', 0)
let g:dockertools_docker_cmd = get(g:, 'dockertools_docker_cmd', 'docker')

Plug 'kevinhui/vim-docker-tools'

nnoremap <Leader>td :DockerToolsToggle<CR>
