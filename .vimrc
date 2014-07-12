set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Pathogen

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T ignores

let g:CommandTWildIgnore=&wildignore . ",**/node_modules/*,**coverage/*,**/bower_components/*"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings

set background=dark
set t_Co=256
colors xoria256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow backspacing over everything in insert mode

set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable folding.

set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving (\w)

nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sudo saving (w!!) and ignore case for saving

cmap w!! w !sudo tee % >/dev/null
cmap W w

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching...

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting

syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse (if terminal has support for it)

if has('mouse')
  set mouse=a
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always set the mouse cursor position

set ruler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off backups, etc.

set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow switching between buffers without saving .

set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show line numbers.

set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set xterm title.

set title

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom file extensions..

au! BufRead,BufNewFile Jakefile     setfiletype javascript
au! BufRead,BufNewFile *.mustache   setfiletype mustache
au! BufRead,BufNewFile *.co         setfiletype coffee
au! BufRead,BufNewFile *.less       setfiletype less

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation settings..

set autoindent
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType text setlocal textwidth=78 " for git commits
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backwards search)

map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Easier way to move between windows.

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  NERD Tree

let NERDTreeShowHidden=1
nnoremap <silent> <C-e><C-f> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode related..

" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map jj to replace the escape key.

:imap jj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment out selected lines (with JS comments)
" TODO: figure out how to do with current filetype's comment

map <leader>g :s/^/\/\//<CR> :silent noh<CR>
map <leader>G :s/^\/\///<CR> :silent noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck en_CA

map <leader>s :setlocal spell spelllang=en_ca<CR>
map <leader>S :setlocal nospell<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load in a custom config in CWD?

if filereadable(".vim.custom")
    so .vim.custom
endif
