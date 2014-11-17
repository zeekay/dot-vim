# zeekay/vim
My vim dotfiles, compatible with [ellipsis][ellipsis].

## Features
Leverages my awesome vim framework, [vice][vice]. All the bells and whistles.

## Install
Clone and symlink or install with [ellipsis][ellipsis]:

## Customization
#### `~/.vim/local/vimrc`
Will override existing vimrc completely.

#### `~/.vim/local/before.vim`
Can be used to customize options set for vice.

#### `~/.vim/local/after.vim`
Will be sourced after default vimrc.

```
$ ellipsis install zeekay/vim
```

[ellipsis]: http://ellipsis.sh
[vim]:      http://www.vim.org
[vice]:     https://github.com/zeekay/vice
