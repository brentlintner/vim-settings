# My [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/) Config

![demo with a few files open](https://raw.githubusercontent.com/brentlintner/vim-settings/master/screenshot.png)

## Commands

| cmd              | description                     |
| ---              | ---                             |
| `tab`            | Snippet auto complete           |
| `space`          | Search for pattern in file      |
| `\space`   | Clear search highlight          |
| `\g WORD`       | Grep files                      |
| `\z`       | Run shell command                      |
| `\b`       | View git blame                      |
| `\w`             | Save all buffers                |
| `\S`             | Edit snippets for current file type                |
| `\t`             | Run current file with npm test                |
| `\T`             | Run current file with phpunit                |
| `\d`       | Delete a buffer window           |
| `\C`             | Close all neoterm windows and buffers                |
| `ctrl-p`         | Search files              |
| `ctrl-n`         | Search buffers / Cycle autocomplete (Insert)  |
| `ctrl-c`       | Close a buffer |
| `ctrl-e+f`       | Open file tree browser          |
| `ctrl-w+{s,S}`   | Toggle spell check              |
| `ctrl-w+v` | Split buffer window vertically             |
| `ctrl-w+n` | Split buffer window horizontally             |
| `ctrl-{h,j,k,l}` | Move around windows             |
| `ctrl-V`         | Paste from clipboard            |
| `ctrl-w+p`       | Strip trailing whitespace       |
| `ctrl-w+t`       | Auto indent md table       |
| `gr`             | Show all file that reference type                |
| `gd`             | Go to definition of type                |
| `\{-,=}`         | Resize vertically split windows |

## Install
```sh
git clone https://github.com/brentlintner/vim-settings.git ~/.vim-settings

cd ~/.vim-settings

git submodule update --init

ln -s ~/.vim-settings/.vimrc
ln -s ~/.vim-settings/.vim
ln -s ~/.vim-settings/.vim ~/.config/nvim

vim +PluginInstall +UpdateRemotePlugins
```
## Main Plugins

Plugins are managed with [Vundle](https://github.com/VundleVim/Vundle.vim).

* [Vim-Polyglot](https://github.com/sheerun/vim-polyglot)
* [EditorConfig](https://github.com/editorconfig/editorconfig-vim)
* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim)
* [Ack](https://github.com/mileszs/ack.vim)
* [NerdCommenter](https://github.com/scrooloose/nerdcommenter)
* [NerdTree](https://github.com/scrooloose/nerdtree)
* [UltiSnips](https://github.com/sirver/ultisnips)
* [Snippets](https://github.com/honza/vim-snippets)
* [CoC](https://github.com/neoclide/coc.nvim)
* [Neoterm](https://github.com/kassio/neoterm)
* [Ale](https://github.com/dense-analysis/ale)
* [Fugitive](https://github.com/tpope/vim-fugitive)

### Dependencies

* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
* [Python](https://pypi.org/project/pip/)
* [Ruby](https://rubygems.org/)
* [Node.js](https://nodejs.org/)
```sh
pacman -S the_silver_searcher # or apt install the_silver_searcher
pip install pynvim
gem install solargraph
```
### Updating Plugins
```sh
vim +PluginClean +PluginUpdate +CocUpdateSync
```
### Submodule Issues

If you get issues about non-release branches you may need to:
```sh
cd .vim/bundle/coc.nvim
git fetch origin
git checkout -b release origin/release
cd ~
```
