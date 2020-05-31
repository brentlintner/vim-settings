# There Be Wizards In Here!

My current [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/) config setup.

Uses [Vundle](https://github.com/VundleVim/Vundle.vim).

See [.vimrc](https://github.com/brentlintner/vim-settings/blob/master/.vimrc#L10) for what plugins will be installed.

## Screenshot

![demo with a few files open](https://raw.githubusercontent.com/brentlintner/vim-settings/master/screenshot.png)

## Requirements

* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
* [CoC Extensions (Optional)](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions)
* [Syntax Checkers (Optional)](https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers)

## Installation
```sh
git clone https://github.com/brentlintner/vim-settings.git ~/.vim-settings

cd ~/.vim-settings
git submodule update --init
cd .vim/bundle/coc.nvim
git fetch origin
git checkout -b release origin/release
cd ~

ln -s ~/.vim-settings/.vimrc
ln -s ~/.vim-settings/.vim
ln -s ~/.vim-settings/.vim ~/.config/nvim

# external deps
pacman -S the_silver_searcher # or apt install the_silver_searcher
pip3 install --user pynvim
gem install solargraph

vim +PluginInstall +qall
vim +UpdateRemotePlugins +qall
```

### Intellisense

Uses [CoC](https://github.com/neoclide/coc.nvim) and its [extensions](https://github.com/neoclide/coc.nvim/network/dependents).

### Update Plugins
```sh
vim +PluginClean +qall
vim +PluginUpdate +qall
vim +CocUpdateSync +qall
```
## Custom Commands

| cmd              | description                     |
| ---              | ---                             |
| `:Ag WORD`       | Grep files                      |
| `tab`            | Snippet auto complete           |
| `space`          | Search for pattern in file      |
| `\space,\s`   | Clear search highlight          |
| `ctrl-w+c`       | Close a buffer window           |
| `\d`       | Delete a buffer window           |
| `\w`             | Save all buffers                |
| `\S`             | Edit snippets for current file type                |
| `\t`             | Run current file with npm test                |
| `\T`             | Run current file with phpunit                |
| `\C`             | Close all neoterm windows and buffers                |
| `ctrl-p`         | Search files              |
| `ctrl-n`         | Search buffers / Cycle autocomplete (Insert)  |
| `ctrl-e+f`       | Open file tree browser          |
| `ctrl-w+{s,S}`   | Toggle spell check              |
| `ctrl-w+v` | Split buffer window vertically             |
| `ctrl-w+n` | Split buffer window horizontally             |
| `ctrl-{h,j,k,l}` | Move around windows             |
| `ctrl-V`         | Paste from clipboard            |
| `ctrl-w+g`       | Toggle undo history             |
| `ctrl-w+p`       | Strip trailing whitespace       |
| `gr`             | Show all file that reference type                |
| `gd`             | Go to definition of type                |
| `\{-,=}`         | Resize vertically split windows |

## Per Directory Config

If you have a `.vim.custom` file in the CWD, it will be evaluated last.
