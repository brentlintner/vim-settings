" keep it awesome- custom file warrants this
set nocompatible

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" disable vim-markdown folder
let g:vim_markdown_folding_disabled=1

" gist-vim
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

" ctrl-p
" TODO: clear cache on pull up? map new key?
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
set wildignore+=*.test*,*.tscache*,*.git/*,*node_modules/*,*coverage/*,*bower_components/*,*.vim/bundle,*tmp/*,*.keep
let g:ctrlp_custom_ignore = '\v[\/](build|dist|\.git|\.hg|\.svn)$'
nnoremap <silent> <C-n> :CtrlPBuffer<CR>

" color and syntax settings
set background=dark
set t_Co=256
colors twilighted
syntax on

set backspace=indent,eol,start " backspacing support

set nofoldenable " Disable folding

" auto passive syntastic mode
let g:syntastic_mode_map = { 'mode': 'passive'}
nmap <C-w>e :SyntasticCheck<CR>

" Fast saving (\w)
nmap <leader>w :wa<cr>

" Sudo saving (w!!)
cmap w!! w !sudo tee % >/dev/null

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
au! BufRead,BufNewFile *.mustache   setfiletype mustache
au! BufRead,BufNewFile *.co         setfiletype coffee
au! BufRead,BufNewFile *.less       setfiletype less

" Indentation settings..
set autoindent
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType hs set tabstop=2|set shiftwidth=2
autocmd FileType text setlocal textwidth=72
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell
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
let NERDTreeIgnore = ['\.baseDir.ts$']
nnoremap <silent> <C-e><C-f> :NERDTreeToggle<CR>

" Map ctrl-j to replace the escape key.
:imap jj <Esc>

" Spellcheck en_CA
nnoremap <C-w>s :setlocal spell spelllang=en_ca<CR>
nnoremap <C-w>S :setlocal nospell<CR>

" Clear search
nnoremap <C-w><space> :let @/ = ""<CR>

" Load in a custom config in CWD?
if filereadable(".vim.custom")
    so .vim.custom
endif

" Need +virtualedit to paste in insert mode.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>
