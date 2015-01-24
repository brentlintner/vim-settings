" keep it awesome- custom file warrants this
set nocompatible

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" disable vim-markdown folder
let g:vim_markdown_folding_disabled=1

" remove trailing spaces
command TRAIL %s/\s\+$//

" html tidy - Meteor
let g:syntastic_html_tidy_ignore_errors = [
    \ '<form> lacks "action" attribute',
    \ '<template> is not recognized!',
    \ 'discarding unexpected <template>'
  \ ]

" gist-vim
let g:gist_clip_command = 'pbcopy' " pbcopy for OSX Only
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

" ctrl-p
" TODO: clear cache on pull up? map new key?
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
set wildignore+=*.git/*,*node_modules/*,*coverage/*,*bower_components/*,*.vim/bundle,*tmp/*,*.keep
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nnoremap <silent> <C-n> :CtrlPBuffer<CR>

" color and syntax settings
set background=dark
set t_Co=256
colors twilighted
syntax on

set backspace=indent,eol,start " backspacing support

set nofoldenable " Disable folding

" Fast saving (\w)
nmap <leader>w :w!<cr>

" Sudo saving (w!!) and ignore case for saving
cmap w!! w !sudo tee % >/dev/null
cmap W w

set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search resultsh
set incsearch " be like search in modern browsers

" Enable mouse (if terminal has support for it)
if has('mouse')
  set mouse=a
endif

set ruler " Always set the mouse cursor position

" Turn off backups, etc.
set nobackup
set nowb
set noswapfile

" Disable wrapping
set nowrap

" Allow switching between buffers without saving .
set hidden

" Always show line numbers.
set number

" Set xterm title.
set title

" Custom file extensions..
au! BufRead,BufNewFile Jakefile     setfiletype javascript
au! BufRead,BufNewFile .jshintrc    setfiletype javascript
au! BufRead,BufNewFile .jslintrc    setfiletype javascript
au! BufRead,BufNewFile *.mustache   setfiletype mustache
au! BufRead,BufNewFile *.co         setfiletype coffee
au! BufRead,BufNewFile *.less       setfiletype less

" Indentation settings..
set autoindent
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType hs set tabstop=2|set shiftwidth=2
autocmd FileType text setlocal textwidth=78 " for git commits
set expandtab

" Map space to / (search)
map <space> /
map <silent> <leader><cr> :noh<cr>

"  Easier way to move between windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"  NERD Tree
let NERDTreeShowHidden=1
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

" Map jj to replace the escape key.
:imap jj <Esc>

" Spellcheck en_CA
map <leader>s :setlocal spell spelllang=en_us<CR>
map <leader>S :setlocal nospell<CR>

" Load in a custom config in CWD?
if filereadable(".vim.custom")
    so .vim.custom
endif

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

" Need +virtualedit to paste in insert mode.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>
