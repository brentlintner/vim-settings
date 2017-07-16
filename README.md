# There Be Wizards In Here!

My current vim setup.

Uses [Vundle](https://github.com/VundleVim/Vundle.vim).

## Installation

```sh
  cd ~/
  git clone https://github.com/brentlintner/vim-settings.git

  ln -s vim-settings/.vimrc
  ln -s vim-settings/.vim

  cd vim-settings

  git submodule update --init
  git submodule foreach git checkout master

  vim +PluginInstall +qall
```

### Update Plugins

```sh
  vim +PluginUpdate +qall
```

## Common Commands

| cmd | description |
| --- | --- |
| `\w` | Save all buffers |
| `\{-,=}` | Resize vertically split windows |
| `space` | Search |
| `ctrl-w+space` | Clear search |
| `ctrl-w+m` | `:make` |
| `ctrl-w+c` | `:close` |
| `ctrl-w+{s,S}` | Toggle spell check |
| `ctrl-p` | Runs :CtrlPMixed |
| `ctrl-n` | Runs :CtrlPBuffer |
| `ctrl-b` | Runs :CtrlPTag |
| `ctrl-e+f` | Runs :NerdTreeToggle |
| `ctrl-{h,j,k,l}` | Move around windows |
| `ctrl-V` | Paste from clipboard |
| `Ack WORD` | Search and display lines matched. `o` opens files |
| `ctrl-w+e` | Run Syntastic |
| `ctrl-w+E` | Close Syntastic |
| `ctrl-w+b` | Toggle Tagbar |
| `ctrl-w+g` | Toggle Gundo |
| `\t` | Close tab |
| `:tabe [path]` | Open tab |

## Adding Custom Commands Per Directory

If you have a `.vim.custom` file in the CWD, it will be evaluated (last).

## Syntastic

Be sure to install any checkers (`rubocop`, `rubycritic`, etc) via:

https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers

## Ack Plugin

Install via: http://beyondgrep.com/install

You might also need to add this to your shell config:

    alias ack="ack-grep"
