# Andrew's vimrc

[![Build Status][travis-image]][travis-url]

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

```
... your code here ...

let g:custom_background = 'light'
let g:custom_colorscheme = 'solarized'
```

To add your own customization, copy `.vimrc.preload` to `~/.vimrc.preload`,
and `.vimrc.afterload` to `~/.vimrc.afterlaod`.

## License

[MIT](LICENSE)

[travis-image]: https://travis-ci.org/apemost/vimrc.svg?branch=master
[travis-url]: https://travis-ci.org/apemost/vimrc
