# There Be Wizards In Here!

My current [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/) config setup.

Uses [Vundle](https://github.com/VundleVim/Vundle.vim).

See [.vimrc](https://github.com/brentlintner/vim-settings/blob/master/.vimrc#L10) for what plugins will be installed.

## Screenshot

![demo with a few files open](https://raw.githubusercontent.com/brentlintner/vim-settings/master/screenshot.png)

## Requirements

* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
* [Syntax Checkers (Optional)](https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers)

## Installation
```sh
  git clone https://github.com/brentlintner/vim-settings.git ~/.vim-settings
  cd ~/.vim-settings

  git submodule update --init
  git submodule foreach git checkout master

  ln -s ~/.vim-settings/.vimrc
  ln -s ~/.vim-settings/.vim
  ln -s ~/.vim-settings/.vim ~/.config/nvim

  vim +PluginInstall +qall
  vim +UpdateRemotePlugins +qall
```
### Update Plugins
```sh
  vim +PluginClean +qall
  vim +PluginUpdate +qall
```
## Custom Commands

| cmd              | description                     |
| ---              | ---                             |
| `space`          | Search for pattern in file      |
| `tab`            | Snippet auto complete           |
| `ctrl-w+space`   | Clear search highlight          |
| `ctrl-p`         | Fuzzy search files              |
| `ctrl-n`         | Fuzzy search current buffers    |
| `ctrl-b`         | Fuzzy search tags               |
| `ctrl-e+f`       | Open file tree browser          |
| `ctrl-w+c`       | Close a buffer window           |
| `ctrl-w+{s,S}`   | Toggle spell check              |
| `ctrl-{h,j,k,l}` | Move around windows             |
| `ctrl-V`         | Paste from clipboard            |
| `ctrl-w+e`       | Run lint check                  |
| `ctrl-w+E`       | Close lint check window         |
| `ctrl-w+g`       | Toggle undo history             |
| `ctrl-w+p`       | Strip trailing whitespace       |
| `Ack WORD`       | Grep files                      |
| `\w`             | Save all buffers                |
| `\t`             | Run Ruby test file              |
| `\T`             | Run Ruby test near current line |
| `\{-,=}`         | Resize vertically split windows |

## Per Directory Config

If you have a `.vim.custom` file in the CWD, it will be evaluated last.
