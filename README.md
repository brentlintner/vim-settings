# There Be Wizards In Here!

My current vim setup.

Inspired by [gtanner's vim config](https://github.com/gtanner/tinyhippos.vimrc).
Uses [Pathogen](https://github.com/tpope/vim-pathogen).
See [Bundles](https://github.com/brentlintner/vim-settings/tree/master/.vim/bundle).

## Requirements

* Vim
* Git
* NodeJS/NPM
* Ack

## Installation

```bash
 cd ~/
 git clone git@github.com:brentlintner/vim-settings.git
 ln -s vim-settings/.vimrc
 ln -s vim-settings/.vim
 cd vim-settings
 ./configure
```

## Common Commands

`jj`

Escape insert mode.

`\w`

Save all buffers.

`space`

Search.

`ctrl-w+space`

Clear search.

`ctrl-w+{c,C}`

Toggle spell check.

`ctrl-p`

Runs :CtrlPMixed.

`ctrl-n`

Runs :CtrlPBuffer.

`ctrl-e+f`

Runs :NerdTreeToggle.

`ctrl-{h,j,k,l}`

Move around windows.

`ctrl-V`

Paste from clipboard.

`Ack WORD`

Search and display lines matched. `o` opens files.

`ctrl-w+E`

Toggle Syntastic passive mode.

## Adding Custom Commands Per Directory

If you have a `.vim.custom` file in the CWD, it will be evaluated (last).

## Syntastic

The `configure` script handles installing some packages.

However, be sure to install them:

https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers

## Ack Plugin

Install via: http://beyondgrep.com/install

You might also need to add this to your shell config:

    alias ack="ack-grep"

## Other References

* http://yavin4.anshul.info/2006/05/18/spell-check-in-vim-7/
* http://vim.cybermirror.org/runtime/vimrc_example.vim
* http://vim.cybermirror.org/runtime/mswin.vim
* http://amix.dk/vim/vimrc.html
* http://www.fprintf.net/vimCheatSheet.html
* http://vim.wikia.com/wiki/Vim_Tips_Wiki
