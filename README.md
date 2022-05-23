# Andrew's vimrc

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a0a558ab726a45c2a5dc83e26b01fab6)](https://app.codacy.com/manual/apemost/vimrc?utm_source=github.com&utm_medium=referral&utm_content=apemost/vimrc&utm_campaign=Badge_Grade_Dashboard)
[![Unit Tests](https://github.com/apemost/vimrc/workflows/unit-tests/badge.svg)](https://github.com/apemost/vimrc/actions?query=workflow%3Aunit-tests)
[![Platform](https://img.shields.io/badge/platform-linux%20%7C%20macos-brightgreen.svg)](https://github.com/apemost/vimrc)
[![PRs Welcome](https://img.shields.io/badge/pull%20requests-welcome-brightgreen.svg)](https://github.com/apemost/vimrc/pulls)

A simple but powerful vim configuration, continually used and tweaked since 2017.

![Screenshot of Vim](assets/vim.png)

## Trying with Docker

```bash
docker run -it --rm apemost/dotfiles vim
```

## Installation

You can clone this repository wherever you want. To install, run command:

```bash
git clone https://github.com/apemost/vimrc.git && cd vimrc && source bootstrap.sh
```

To update, `cd` into your local `vimrc` repository and then:

```bash
source bootstrap.sh
```

## Setting up for the first time

We will automatically setting up the [vim-plug](https://github.com/junegunn/vim-plug)
plugin manager when you open vim for the first time.

Then, you can:

- run `:PlugInstall` to install the plugins
- run `:PlugUpdate` to update the plugins
- see [tutorial](https://github.com/junegunn/vim-plug/wiki/tutorial) page to learn the basics of vim-plug

## Adding your own customization

To conveniently add your own customization, copy [vimrc.preload](vimrc.preload)
to `~/.vimrc.preload`, and [vimrc.afterload](vimrc.afterload) to `~/.vimrc.afterlaod`.

### Changing the default color scheme

Edit `~/.vimrc.preload`:

```vim
let g:custom_background = 'light'
let g:custom_colorscheme = 'solarized'
```

### Enable completion and lint plugins

The completion and lint plugins are disabled by default. To enable them, edit `~/.vimrc.preload`:

```vim
let g:custom_completion_plugin = 'youcompleteme'
let g:custom_lint_plugin = 'ale'
```

### Adding your plugins

Edit `~/.vimrc.preload`:

```vim
let g:custom_plugins = [
      \   ['NLKNguyen/papercolor-theme'],
      \ ]
```

Reload `.vimrc` and run `:PlugInstall`.

### Disable built-in plugins

Edit `~/.vimrc.preload`:

```vim
let g:custom_disabled_plugins = [
      \   'sneak',
      \   'go',
      \ ]
```

## Consistent experience for IdeaVim

Link the [ideavimrc](ideavimrc) to `~/.ideavimrc`:

```bash
ln -s "$PWD/ideavimrc" ~/.ideavimrc
```

Or:

```bash
cp ideavimrc ~/.ideavimrc
```

## Consistent experience for VSCodeVim

Copy the content of [vscodevim.json](vscodevim.json) to your VS Code configuration file such as `settings.json`.

## Normal mode leader key mappings

| Key                | Command                            | Comment                                                                          |
| ------------------ | ---------------------------------- | -------------------------------------------------------------------------------- |
| \<Leader>1         | \<Plug>AirlineSelectTab1           | Select tab 1                                                                     |
| \<Leader>2         | \<Plug>AirlineSelectTab2           | Select tab 2                                                                     |
| \<Leader>3         | \<Plug>AirlineSelectTab3           | Select tab 3                                                                     |
| \<Leader>4         | \<Plug>AirlineSelectTab4           | Select tab 4                                                                     |
| \<Leader>5         | \<Plug>AirlineSelectTab5           | Select tab 5                                                                     |
| \<Leader>6         | \<Plug>AirlineSelectTab6           | Select tab 6                                                                     |
| \<Leader>7         | \<Plug>AirlineSelectTab7           | Select tab 7                                                                     |
| \<Leader>8         | \<Plug>AirlineSelectTab8           | Select tab 8                                                                     |
| \<Leader>9         | \<Plug>AirlineSelectTab9           | Select tab 9                                                                     |
| \<Leader>:         | :AsyncRun\<Space>                  | Run async shell commands                                                         |
| \<Leader>\<Tab>    | :Maps\<CR>                         | Normal mode mappings                                                             |
| \<Leader>=         | :Neoformat\<CR>                    | Neoformat                                                                        |
| \<Leader>W         | :w !sudo tee % > /dev/null\<CR>    | Save as superuser                                                                |
| \<Leader>a:        | :Tabularize /:\zs\<CR>             | Text align at `:`                                                                |
| \<Leader>a=        | :Tabularize /=\<CR>                | Text align at `=`                                                                |
| \<Leader>ac        | :Pangu\<CR>                        | Add space between Chinese characters and English letters/numbers/marks           |
| \<Leader>at        | :TableFormat\<CR>                  | Table format                                                                     |
| \<Leader>bb        | :Buffers\<CR>                      | Open buffers                                                                     |
| \<Leader>bd        | :Bdelete\<CR>                      | Unload current buffer and delete it from the buffer list                         |
| \<Leader>bh        | :BCommits\<CR>                     | Git commits for the current buffer                                               |
| \<Leader>bo        | :BufOnly\<CR>                      | Delete all the buffers except the current buffer                                 |
| \<Leader>bw        | :Bwipeout\<CR>                     | Like `:Bdelete`, but really delete the buffer                                    |
| \<Leader>c\$       | \<Plug>NERDCommenterToEOL          | Comment the current line from the cursor to the end of line                      |
| \<Leader>c\<Space> | \<Plug>NERDCommenterToggle         | Toggle the comment state of the selected line(s)                                 |
| \<Leader>cA        | \<Plug>NERDCommenterAppend         | Add comment delimiters to the end of line and goes into insert mode between them |
| \<Leader>ca        | \<Plug>NERDCommenterAltDelims      | Switch to the alternative set of delimiters                                      |
| \<Leader>cb        | \<Plug>NERDCommenterAlignBoth      | Same as `<Leader>cc` except that the delimiters are aligned down the both side   |
| \<Leader>cc        | \<Plug>NERDCommenterComment        | Comment out the current line or text selected in visual mode                     |
| \<Leader>ci        | \<Plug>NERDCommenterInvert         | Toggle the comment state of the selected line(s) individually                    |
| \<Leader>cl        | \<Plug>NERDCommenterAlignLeft      | Same as `<Leader>cc` except that the delimiters are aligned down the left side   |
| \<Leader>cm        | \<Plug>NERDCommenterMinimal        | Comment the given lines using only one set of multipart delimiters               |
| \<Leader>cn        | \<Plug>NERDCommenterNested         | Same as `<Leader>cc` but forces nesting                                          |
| \<Leader>cs        | \<Plug>NERDCommenterSexy           | Comment out the selected lines sexily                                            |
| \<Leader>cu        | \<Plug>NERDCommenterUncomment      | Uncomment the selected line(s)                                                   |
| \<Leader>cy        | \<Plug>NERDCommenterYank           | Same as `<Leader>cc` except that the commented line(s) are yanked first          |
| \<Leader>f/        | :History/\<CR>                     | Search history                                                                   |
| \<Leader>f:        | :History:\<CR>                     | Command history                                                                  |
| \<Leader>fa        | :Ag\<Space>\<C-r>\<C-w>\<CR>       | `ag` search result at current word                                               |
| \<Leader>fc        | :Commands\<CR>                     | List commands                                                                    |
| \<Leader>ff        | :GFiles\<CR>                       | Git files (`git ls-files`)                                                       |
| \<Leader>fg        | :Gg\<Space>\<C-r>\<C-w>\<CR>       | `git grep` search result at current word                                         |
| \<Leader>fh        | :History\<CR>                      | `v:oldfiles` and open buffers                                                    |
| \<Leader>fm        | :Marks\<CR>                        | List marks                                                                       |
| \<Leader>fr        | :Rg\<Space>\<C-r>\<C-w>\<CR>       | `rg` search result at current word                                               |
| \<Leader>fs        | :GFiles?\<CR>                      | Git files (`git status`)                                                         |
| \<Leader>fu        | :Snippets\<CR>                     | List snippets (UltiSnips)                                                        |
| \<Leader>fw        | :Windows\<CR>                      | List windows                                                                     |
| \<Leader>fz        | :FZF\<Space>                       | `fzf`                                                                            |
| \<Leader>gb        | :Gblame\<CR>                       | `git blame`                                                                      |
| \<Leader>gc        | :Gcommit\<Space>                   | `git commit`                                                                     |
| \<Leader>gD        | :Gdiff\<Space>                     | `git diff`                                                                       |
| \<Leader>gd        | :Gdiff\<CR>                        | `git diff`                                                                       |
| \<Leader>ge        | :Gedit\<Space>                     | `:edit` a `fugitive-object`                                                      |
| \<Leader>gf        | :Gfetch\<Space>                    | `git fetch`                                                                      |
| \<Leader>gg        | :GFiles\<CR>                       | Git files (`git ls-files`)                                                       |
| \<Leader>gh        | :Commits\<CR>                      | Git commits (requires fugitive.vim)                                              |
| \<Leader>gl        | :Gpull\<Space>                     | `git pull`                                                                       |
| \<Leader>gm        | :Gmerge\<Space>                    | `git merge`                                                                      |
| \<Leader>gp        | :Gpush\<Space>                     | `git push`                                                                       |
| \<Leader>gr        | :Gread\<Space>                     | Empty the buffer and `:read` a `fugitive-object`                                 |
| \<Leader>gs        | :Gstatus\<CR>                      | `git status`                                                                     |
| \<Leader>gV        | :GV\<Space>                        | Open commit browser                                                              |
| \<Leader>gv        | :GV!\<CR>                          | List commits that affected the current file                                      |
| \<Leader>gw        | :Gwrite<Space>                     | Write to the current file's path and stage the results                           |
| \<Leader>jd        | :YcmCompleter GoToDeclaration\<CR> | Looks up the symbol under the cursor and jumps to its declaration                |
| \<Leader>ji        | :YcmCompleter GoToInclude\<CR>     | Looks up the current line for a header and jumps to it                           |
| \<Leader>jj        | :YcmCompleter GoToDefinition\<CR>  | Looks up the symbol under the cursor and jumps to its definition                 |
| \<Leader>jr        | :YcmCompleter GoToReferences\<CR>  | Reference finding                                                                |
| \<Leader>nj        | :NERDTreeFind\<CR>                 | Find and reveal the file in the NERD tree                                        |
| \<Leader>nn        | :NERDTreeFocus\<CR>                | Focus NERD tree                                                                  |
| \<Leader>pm        | :MarkdownPreview\<CR>              | Preview markdown                                                                 |
| \<Leader>qr        | \<Plug>(quickrun)                  | Execute whole/part of editing file                                               |
| \<Leader>sG        | :GG\<Space>                        | `git grep` search result                                                         |
| \<Leader>sR        | :RG\<Space>                        | `rg` search result                                                               |
| \<Leader>sa        | :Ag\<Space>                        | `ag` search result                                                               |
| \<Leader>se        |                                    | Search engine result                                                             |
| \<Leader>sg        | :Gg\<Space>                        | `git grep` search result                                                         |
| \<Leader>sr        | :Rg\<Space>                        | `rg` search result                                                               |
| \<Leader>td        | :DockerToolsToggle\<CR>            | Toggle docker tools                                                              |
| \<Leader>tn        | :NERDTreeToggle\<CR>               | Toggle NERD tree                                                                 |
| \<Leader>tt        | :TagbarToggle\<CR>                 | Toggle tagbar                                                                    |
| \<Leader>tu        | :UndotreeToggle\<CR>               | Toggle undotree                                                                  |
| \<Leader>yf        | :let @+ = expand("%:p")\<CR>       | Yank full path of current buffer                                                 |
| \<Leader>yn        | :let @+ = expand("%")\<CR>         | Yank relative path of current buffer                                             |

## Uninstallation

Run `rm ~/.vimrc`.

## FAQ

### How dare you remap s?

> You can specify any mapping for Sneak (see `:help sneak`). By the way: `cl` is equivalent to `s`, and `cc` is equivalent to `S`.

See https://github.com/justinmk/vim-sneak#how-dare-you-remap-s

To disable Sneak, see [Disable built-in plugins](#disable-built-in-plugins)

## Contributing

All contributions are welcome!
If you would like to hack on this work, please follow these steps:

1. [Fork this repository](https://github.com/apemost/vimrc/fork)
2. Make your changes
3. [Submit a pull request](https://github.com/apemost/vimrc/pull/new/main)

## License

[MIT](LICENSE)
