# My [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/) Config

![demo with a few files open](https://raw.githubusercontent.com/brentlintner/vim-settings/master/screenshot.png)

## Commands

| cmd              | description                     |
| ---              | ---                             |
| `tab`            | Snippet auto complete           |
| `space`          | Search for pattern in file      |
| `\space`   | Clear search highlight          |
| `\g WORD`       | Grep files                      |
| `\b`       | View git blame                      |
| `\w`             | Save all buffers                |
| `\S`             | Edit snippets for current file type                |
| `\d`       | Delete a buffer window           |
| `\cc`       | Comment out selected lines           |
| `\ci`       | Uncomment selected lines           |
| `c-p`         | Search files / Cycling autocomplete reverse (Insert)              |
| `c-n`         | Search buffers / Cycle autocomplete (Insert)  |
| `c-c`       | Close a buffer |
| `c-e+f`       | Open file tree browser          |
| `c-e+p`       | Open lsp symbol browser          |
| `c-e+l`       | Show lint/compile errors          |
| `c-w+{s,S}`   | Toggle spell check              |
| `c-w+v` | Split buffer window vertically             |
| `c-w+n` | Split buffer window horizontally             |
| `c-w+c` | Delete a buffer             |
| `c-{h,j,k,l}` | Move around windows             |
| `c-V`         | Paste from clipboard            |
| `\{-,=}`         | Resize vertically split windows |
| `gr`             | Show all files/instances that reference type                |
| `gd`             | Go to definition of type                |
| `gi`             | Go to type definition of type                |
| `gr`             | Go to implementation of type                |
| `gh`             | Show function signature  |

## Install
```sh
git clone https://github.com/brentlintner/vim-settings.git ~/.vim-settings

cd ~/.vim-settings

git submodule update --init

cd ~/

ln -s ~/.vim-settings/.vimrc
ln -s ~/.vim-settings/.vim
ln -s ~/.vim-settings/.vim ~/.config/nvim

vim +PluginInstall +UpdateRemotePlugins
```
## Main Plugins

Plugins are managed with [Vundle](https://github.com/VundleVim/Vundle.vim).

For installed plugins see [.vimrc](.vimrc);

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
