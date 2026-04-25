syntax on

colorscheme everforest

filetype plugin indent on

set shell=/bin/zsh
set title
set t_Co=256
set termguicolors
set background=dark
set shortmess+=I
set encoding=UTF-8
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=1
set expandtab
set nowrap
set number " Show hybrid line numbers except when out of focus or in Insert
set linebreak
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch
set hidden " Allow switching between buffers without saving .
set conceallevel=3
set verbose=0
set backspace=indent,eol,start " backspacing support
set foldmethod=indent
set foldlevel=99
set ruler " Always set the mouse cursor position
set nobackup
set nowritebackup
set nowb
set noswapfile

if has('mouse')
  set mouse=a
endif

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

let g:everforest_transparent_background = 1
let g:transparent_groups = [
  \ 'Normal', 'Comment', 'Constant', 'Special', 'Identifier',
  \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
  \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
  \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  \ 'StatusLine', 'StatusLineNC'
\]
let g:transparent_groups += ['Pmenu']
let g:transparent_groups += ['CtrlPMode1', 'CtrlPMode2', 'CtrlPStats'] " CtrlP
let g:transparent_groups += ['NormalFloat'] " coc.nvim

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

nnoremap <silent> <C-n> :CtrlPBuffer<CR>
"nnoremap <silent> <C-t> :CtrlPTag<CR>

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
nmap <silent> gi :call CocAction('doHover')<CR>
nmap <silent> gl :CocDiagnostics<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"nnoremap <silent> <C-e><C-p> :CocOutline<CR>
nnoremap <silent> <C-e><C-p> :Vista!!<CR>
nnoremap <silent> <C-e><C-l> :CocDiagnostics<CR>
nnoremap <silent> <C-e><C-a> :lopen<CR>

command! -nargs=0 DashOpen :let word = expand("<cword>") | execute '!open "dash://?query=' . word . '"'
nnoremap gs :DashOpen<CR>

map <C-w>f :Ack<space>

" Smoother y/e scrolling
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Fast saving
nmap <leader>w :wa<cr>
noremap <C-w>w :wa<CR>

hi Normal guibg=NONE ctermbg=NONE
hi VertSplit guifg=#060606 guibg=NONE ctermfg=000 ctermbg=NONE

hi ALEErrorSign guibg=NONE ctermbg=NONE
hi ALEWarningSign guibg=NONE ctermbg=NONE

" transparent sign column
hi SignColumn guibg=NONE ctermbg=NONE

" Highlight char when over textwidth
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%121v', 120)

" Map space to search
map <space> /

" Easier way to move between windows.
" Apparenty (ATM), Neovim sends <BS> vs ^H
" https://github.com/neovim/neovim/issues/2048#issuecomment-77159983
if has('nvim')
    nmap <BS> <C-W>h
endif
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Show git blame
nmap <leader>b :GitMessenger<CR>
nmap <leader>B :Git<space>blame<CR>
nmap <leader>l :0Gclog<CR>

" window and neoterm commands
" TODO: use leader vs C where possible
nmap <C-c> :close<CR>
"nmap <leader>z :TcloseAll! \| :T<space>
nmap <C-w>c :bd<CR>
"nmap <leader>C :TcloseAll!<CR>
"nmap <leader>t :TcloseAll! \| :T npm t %<cr>
"nmap <leader>T :TcloseAll! \| :T ./vendor/bin/phpunit %<cr>

" Make sure it always shows
set laststatus=2

" Resize windows
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>= :vertical resize +5<CR>

nnoremap <silent> <C-e><C-f> :NvimTreeToggle<CR>

" different split
"nnoremap <C-w>e :split<CR>
nnoremap <C-w>v :vsplit<CR>

" Spellcheck en_CA
nnoremap <C-w>p :setlocal spell spelllang=en_ca<CR>
nnoremap <C-w>P :setlocal nospell<CR>

" Clear search
nnoremap <C-w><space> :let @/ = ""<CR>
map <leader><space> :let @/ = ""<CR>
map <silent> <leader><cr> :noh<cr>

if has('win32')
	nnoremap <c-z> <nop>
endif
