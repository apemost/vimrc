# Andrew's vimrc

[![Build Status](https://travis-ci.org/apemost/vimrc.svg?branch=master)](https://travis-ci.org/apemost/vimrc)
[![Platform](https://img.shields.io/badge/platform-linux%20%7C%20macos-brightgreen.svg)](https://github.com/apemost/vimrc)
[![PRs Welcome](https://img.shields.io/badge/pull%20requests-welcome-brightgreen.svg)](https://github.com/apemost/vimrc/pulls)

This is my Vim configuration, continually used and tweaked since 2017.

![Screenshot of Vim](assets/vim.png)

## Installation

You can clone this repository wherever you want. To install, run command:

```bash
git clone https://github.com/apemost/vimrc.git && cd vimrc && source bootstrap.sh
```

To update, `cd` into your local `vimrc` repository and then:

```bash
source bootstrap.sh
```

## Built-in plugins:

- [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [ale](https://github.com/w0rp/ale)
- [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
- [emmet-vim](https://github.com/mattn/emmet-vim)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [fzf](https://github.com/junegunn/fzf)
- [gruvbox](https://github.com/morhetz/gruvbox)
- [gv.vim](https://github.com/junegunn/gv.vim)
- [is.vim](https://github.com/haya14busa/is.vim)
- [jump.vim](https://github.com/padde/jump.vim)
- [kotlin-vim](https://github.com/udalov/kotlin-vim)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [nginx.vim](https://github.com/chr4/nginx.vim)
- [pangu.vim](https://github.com/hotoo/pangu.vim)
- [plantuml-syntax](https://github.com/aklt/plantuml-syntax)
- [rename.vim](https://github.com/danro/rename.vim)
- [swift.vim](https://github.com/keith/swift.vim)
- [tabular](https://github.com/godlygeek/tabular)
- [tagbar](https://github.com/majutsushi/tagbar)
- [tmuxline.vim](https://github.com/edkolev/tmuxline.vim)
- [typescript-vim](https://github.com/leafgarland/typescript-vim)
- [ultisnips](https://github.com/SirVer/ultisnips)
- [undotree](https://github.com/mbbill/undotree)
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-auto-save](https://github.com/907th/vim-auto-save)
- [vim-autoformat](https://github.com/chiel92/vim-autoformat)
- [vim-bbye](https://github.com/moll/vim-bbye)
- [vim-bufonly](https://github.com/schickling/vim-bufonly)
- [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
- [vim-docker-tools](https://github.com/kevinhui/vim-docker-tools)
- [vim-emacscommandline](https://github.com/houtsnip/vim-emacscommandline)
- [vim-endwise](https://github.com/tpope/vim-endwise)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-gnupg](https://github.com/jamessan/vim-gnupg)
- [vim-go](https://github.com/fatih/vim-go)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [vim-javascript](https://github.com/pangloss/vim-javascript)
- [vim-jsdoc](https://github.com/heavenshell/vim-jsdoc)
- [vim-json](https://github.com/elzr/vim-json)
- [vim-jsx](https://github.com/mxw/vim-jsx)
- [vim-markdown-preview](https://github.com/JamshedVesuna/vim-markdown-preview)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
- [vim-pydocstring](https://github.com/heavenshell/vim-pydocstring)
- [vim-quickrun](https://github.com/thinca/vim-quickrun)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-sneak](https://github.com/justinmk/vim-sneak)
- [vim-snippets](https://github.com/honza/vim-snippets)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-toml](https://github.com/cespare/vim-toml)
- [vim-vue](https://github.com/posva/vim-vue)
- [vimux](https://github.com/benmills/vimux)

## Changing themes and adding your own customization

To change themes, create a file `~/.vimrc.preload`, which looks like this:

```vim
let g:custom_background = 'light'
let g:custom_colorscheme = 'solarized'
```

To conveniently add your own customization, copy `vimrc.preload` to `~/.vimrc.preload`,
and `vimrc.afterload` to `~/.vimrc.afterlaod`.

## Add your custom plugin as builtin

Create `your_custom_plugin.vim` under `~/.vim/plugins`.

Add plugin and customize like:

```vim
Plug 'gitrepo/your_custom_plugin'

let g:custom_settings = 'custom_value'
```

Then add custom plugin file name at `~/.vim/plugins/init.vim`, see below:

```vim
let s:builtin_plugins = [
\ 'your_custom_plugin',
....
```

Finally source your vimrc and run `:PlugInstall`.

## Normal mode leader key mappings

| Key                | Command                       | Comment                       |
|--------------------|-------------------------------|-------------------------------|
| \<Leader>1         |                               |                               |
| \<Leader>2         |                               |                               |
| \<Leader>3         |                               |                               |
| \<Leader>4         |                               |                               |
| \<Leader>5         |                               |                               |
| \<Leader>6         |                               |                               |
| \<Leader>7         |                               |                               |
| \<Leader>8         |                               |                               |
| \<Leader>9         |                               |                               |
| \<Leader>:         |                               |                               |
| \<Leader>\<Tab>    | :Maps\<CR>                    | Normal mode mappings          |
| \<Leader>=         |                               |                               |
| \<Leader>W         |                               |                               |
| \<Leader>a:        |                               |                               |
| \<Leader>a=        |                               |                               |
| \<Leader>ac        |                               |                               |
| \<Leader>at        |                               |                               |
| \<Leader>bb        | :Buffers\<CR>                 | Open buffers                  |
| \<Leader>bd        |                               |                               |
| \<Leader>bh        |                               |                               |
| \<Leader>bo        |                               |                               |
| \<Leader>bw        |                               |                               |
| \<Leader>c$        |                               |                               |
| \<Leader>c\<Space> |                               |                               |
| \<Leader>cA        |                               |                               |
| \<Leader>ca        |                               |                               |
| \<Leader>cb        |                               |                               |
| \<Leader>cc        |                               |                               |
| \<Leader>ci        |                               |                               |
| \<Leader>cl        | \<Plug>NERDCommenterAlignLeft |                               |
| \<Leader>cm        |                               |                               |
| \<Leader>cn        |                               |                               |
| \<Leader>cs        |                               |                               |
| \<Leader>cu        | \<Plug>NERDCommenterUncomment |                               |
| \<Leader>cy        |                               |                               |
| \<Leader>f/        |                               |                               |
| \<Leader>f:        |                               |                               |
| \<Leader>fa        |                               |                               |
| \<Leader>fc        |                               |                               |
| \<Leader>ff        | :GFiles\<CR>                  | Git files (`git ls-files`)    |
| \<Leader>fg        |                               |                               |
| \<Leader>fh        | :History\<CR>                 | `v:oldfiles` and open buffers |
| \<Leader>fm        |                               |                               |
| \<Leader>fr        |                               |                               |
| \<Leader>fs        | :GFiles?\<CR>                 | Git files (`git status`)      |
| \<Leader>fu        |                               |                               |
| \<Leader>fw        |                               |                               |
| \<Leader>fz        | :FZF\<Space>                  |                               |
| \<Leader>gb        |                               |                               |
| \<Leader>gc        | :Gcommit\<Space>              |                               |
| \<Leader>gd        |                               |                               |
| \<Leader>ge        |                               |                               |
| \<Leader>gf        |                               |                               |
| \<Leader>gg        |                               |                               |
| \<Leader>gh        |                               |                               |
| \<Leader>gl        |                               |                               |
| \<Leader>gm        |                               |                               |
| \<Leader>gp        |                               |                               |
| \<Leader>gr        |                               |                               |
| \<Leader>gs        | :Gstatus\<CR>                 |                               |
| \<Leader>gv        |                               |                               |
| \<Leader>gw        |                               |                               |
| \<Leader>jd        |                               |                               |
| \<Leader>ji        |                               |                               |
| \<Leader>jj        |                               |                               |
| \<Leader>jr        |                               |                               |
| \<Leader>nj        |                               |                               |
| \<Leader>nn        |                               |                               |
| \<Leader>qr        |                               |                               |
| \<Leader>sG        | :GG\<Space>                   | `git grep` search result      |
| \<Leader>sR        | :RG\<Space>                   | `rg` search result            |
| \<Leader>sa        | :Ag\<Space>                   | `ag` search result            |
| \<Leader>se        |                               |                               |
| \<Leader>sg        | :Gg\<Space>                   | `git grep` search result      |
| \<Leader>sr        | :Rg\<Space>                   | `rg` search result            |
| \<Leader>td        |                               |                               |
| \<Leader>tn        |                               |                               |
| \<Leader>tt        |                               |                               |
| \<Leader>tu        |                               |                               |
| \<Leader>vc        |                               |                               |
| \<Leader>vi        |                               |                               |
| \<Leader>vl        |                               |                               |
| \<Leader>vp        |                               |                               |
| \<Leader>vq        |                               |                               |
| \<Leader>vr        |                               |                               |
| \<Leader>vz        |                               |                               |
| \<Leader>yf        |                               |                               |
| \<Leader>yn        |                               |                               |

## Uninstallation

Run `rm ~/.vimrc`.

## Contributing

All contributions are welcome!
If you would like to hack on this work, please follow these steps:

1. Fork this repository
2. Make your changes
3. Submit a pull request

## License

[MIT](LICENSE)
