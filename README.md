# There Be Wizards In Here!

My current vim setup.

Inspired by [gtanner's vim config](https://github.com/gtanner/tinyhippos.vimrc).

Uses [Pathogen](https://github.com/tpope/vim-pathogen).

See [Bundles](https://github.com/brentlintner/vim-settings/tree/master/.vim/bundle).

## Requirements

* Vim (with Ruby support)
* Git
* Ruby (with ruby-dev headers)
* NodeJS/NPM
* GNU toolchain (or equivalent)
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

You will also need to put this in your `.bashrc`.

    export VIM_SETTINGS="$HOME/path/to/vim-settings-repo"

## Command-T Plugin

This is what requires ruby, ruby-dev, a toolchain and vim compiled with ruby support.

Having troubles: see [Install Vim with Ruby Support and Command-t Plugin on Ubuntu](http://www.justinbar.net/post/install-vim-with-ruby-support-and-command-t-plugin-on-ubuntu).

If you don't want to use it, then just remove the git repo from `.vim/bundle`.

## Ack Plugin

Install via: http://beyondgrep.com/install

You might also need to:

    alias ack="ack-grep"

In your `.bashrc`.

## Adding Custom Commands Per Directory

If you have a `.vim.custom` file in the CWD, it will be evaluated (last).

## Other References

* http://yavin4.anshul.info/2006/05/18/spell-check-in-vim-7/
* http://vim.cybermirror.org/runtime/vimrc_example.vim
* http://vim.cybermirror.org/runtime/mswin.vim
* http://amix.dk/vim/vimrc.html
* http://www.fprintf.net/vimCheatSheet.html
* http://vim.wikia.com/wiki/Vim_Tips_Wiki
