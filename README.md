# Andrew's vimrc

[![build Status](https://travis-ci.org/apemost/vimrc.svg?branch=master)](https://travis-ci.org/apemost/vimrc)

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

## Changing themes and adding your own customization

To change themes, create a file `~/.vimrc.preload`, which looks like this:

```vim
let g:custom_background = 'light'
let g:custom_colorscheme = 'solarized'
```

To conveniently add your own customization, copy `.vimrc.preload` to `~/.vimrc.preload`,
and `.vimrc.afterload` to `~/.vimrc.afterlaod`.

## Add your custom plugin as builtin

Create `your_custom_plugin.vim` under `~/.vim/config/plugins`.

Add plugin and customize like:

```vim
Plug 'gitrepo/your_custom_plugin'

let g:custom_settings = 'custom_value'
```

Then add custom plugin file name at `~/.vim/config/plugins.vim`, see below:

```vim
let s:builtin_plugins = [
     \ 'your_custom_plugin',
     ....
```

Finally source your vimrc and run `PlugInstall`.

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
