# My [Neovim](https://neovim.io/) Config

![demo with a few files open](https://raw.githubusercontent.com/brentlintner/vim-settings/master/screenshot.png)

## Dependencies

* [Python](https://pypi.org/project/pip/)
* [Ruby](https://rubygems.org/)
* [Node.js](https://nodejs.org/)
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)

## Main Plugins

Plugins are managed with [lazy.nvim](https://lazy.folke.io).

For installed plugins see [init.lua](init.lua).

## Install
```sh
git clone https://github.com/brentlintner/vim-settings.git ~/.config/nvim

brew install the_silver_searcher
pip install pynvim
gem install solargraph neovim
npm install -g neovim

nvim +Lazy
nvim +TSUpdate +UpdateRemotePlugins +CocInstall
nvim +checkhealth
```

## Commands

| cmd              | description                     |
| ---              | ---                             |
| `space`          | Search for pattern in file      |
| `<c-w>space`   | Clear search highlight          |
| `\g WORD`       | Grep files                      |
| `\b`    | View git commit message for current line              |
| `\B`       | View git blame                      |
| `\l`       | View git file history                      |
| `\cc`       | Comment out selected lines           |
| `\ci`       | Uncomment selected lines           |
| `\{-,=}`         | Resize vertically split windows |
| `<c-p>`         | Search files / Cycling autocomplete reverse (Insert)              |
| `<c-n>`         | Search buffers / Cycle autocomplete (Insert)  |
| `<c-c>`       | Close a buffer |
| `<c-w>c`       | Delete a buffer |
| `<c-w>w`             | Save all buffers                |
| `<c-w>v` | Split buffer window vertically             |
| `<c-w>s` | Split buffer window horizontally             |
| `<c-w>c` | Delete a buffer             |
| `<c-w>{p,P}`   | Toggle spell check              |
| `<c-{h,j,k,l}>` | Move around windows             |
| `<c-V>`         | Paste from clipboard            |
| `<c-e><c-f>`       | Open file tree browser          |
| `<c-e><c-p>`       | Open lsp symbol browser          |
| `<c-e><c-l>`       | Show lint/compile errors          |
| `gr`             | Show all files/instances that reference type                |
| `gd`             | Go to definition of type                |
| `gi`             | Search current word in Dash                |
| `gh`             | Show function signature  |
| `gh`             | Show function signature  |
| `gl`             | Show diagnostic errors pane  |
| `zc`             | Fold at syntax  |
| `zo`             | Fold open at syntax  |
| `zR`             | Fold open all  |
| `b,B`             | Backword jumps |
| `w,W`             | Forward jumps  |
