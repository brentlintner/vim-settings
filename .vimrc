" -- plugin management --

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'brentlintner/twilighted.vim'
Plugin 'mhinz/vim-janah'
Plugin 'joshdick/onedark.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'airblade/vim-gitgutter'
Plugin 'dag/vim2hs'
Plugin 'depuracao/vim-rdoc'
Plugin 'derekwyatt/vim-scala'
Plugin 'digitaltoad/vim-jade'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/csapprox'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'StanAngeloff/php.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'peterhoeg/vim-qml'
Plugin 'plasticboy/vim-markdown'
Plugin 'PProvost/vim-ps1'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wavded/vim-stylus'
Plugin 'kurko/smartest.vim'
Plugin 'godlygeek/tabular'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'docker/docker', { 'rtp': '/contrib/syntax/vim' }
Plugin 'posva/vim-vue'
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }
Plugin 'kassio/neoterm', { 'branch': 'release' }
Plugin 'dense-analysis/ale'

call vundle#end()

" -- main config --

" color and syntax settings
syntax on
set t_Co=256
colorscheme twilighted
hi Normal guibg=NONE ctermbg=NONE

" disable bg color for onedark
"if (has("autocmd") && !has("gui_running"))
  "augroup colorset
    "autocmd!
    "let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    "autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  "augroup END
"endif

set wildignore+=*/build/,*/storage/*,*/.build/*,*/public/*,*.idea*,*.gradle/*,*/dist/*,*android/build/*,*app/build/*,*build/lib*,*vendor/*,*.docs*,*/.test*,*.tscache*,*.git/*,*node_modules/*,*coverage/*,*bower_components/*,*.vim/bundle,*tmp/*,*.cabal-sandbox/*,*.keep

" ctrl-p
" TODO: clear cache on pull up? map new key?
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
            \   'dir' : '\.test|node_modules|\.git$|\.hg$|\.svn$',
            \   'file': '',
            \ }
nnoremap <silent> <C-n> :CtrlPBuffer<CR>
nnoremap <silent> <C-b> :CtrlPTag<CR>

" git gutter
let g:gitgutter_set_sign_backgrounds = 0
hi SignColumn guibg=NONE ctermbg=NONE

" speed up vue plugin
let g:vue_disable_pre_processors = 1

" set snippet keys
let g:UltiSnipsExpandTrigger="<tab>"

" enable clipboard
set clipboard=unnamedplus

" use silver searcher underneath ack.vim
let g:ackprg = 'ag -i --nogroup --nocolor --column --ignore node_modules --ignore coverage --ignore storage --ignore dist --ignore "*.lock" --ignore build --ignore package-lock.json'

" disable vim-markdown folder
let g:vim_markdown_folding_disabled=1

" CoC settings
inoremap <silent><expr> <c-n> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" gist-vim
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

set backspace=indent,eol,start " backspacing support

set nofoldenable " Disable folding

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
au! BufRead,BufNewFile *.es6        setfiletype javascript

" Highlight char when over textwidth
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 80)

" Indentation settings..
set autoindent
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType hs set tabstop=2|set shiftwidth=2
autocmd FileType coffee set tabstop=2|set shiftwidth=2
autocmd FileType vim set tabstop=4|set shiftwidth=4
autocmd FileType text setlocal textwidth=72
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell
set expandtab

" Map space to / (search)
map <space> /
map <silent> <leader><cr> :noh<cr>

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

" TypeScript config
let g:typescript_compiler_binary = 'npx tsc'
let g:typescript_compiler_options = ''

" window and neoterm commands
nmap <C-w>c :close<CR>
nmap <C-w>C :TcloseAll!<CR>
nmap <leader>t :T npm t %<cr>
nmap <leader>t :T npm t %<cr>
nmap <leader>T :T ./vendor/bin/phpunit %<cr>

" Clear whitespace
nmap <C-w>p :StripWhitespace<CR>

" Make sure it always shows
set laststatus=2

" Resize windows
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>= :vertical resize +5<CR>

"  NERD Tree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = []
nnoremap <silent> <C-e><C-f> :NERDTreeToggle<CR>

" Spellcheck en_CA
nnoremap <C-w>s :setlocal spell spelllang=en_ca<CR>
nnoremap <C-w>S :setlocal nospell<CR>

" Clear search
nnoremap <C-w><space> :let @/ = ""<CR>

" Gundo shortcut
nnoremap <C-w>g :GundoToggle<CR>

" Load in a custom config in CWD?
if filereadable('.vim.custom')
    so .vim.custom
endif

if !has('nvim')
    " Need +virtualedit to paste in insert mode.
    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
    imap <S-Insert> <C-V>
    vmap <S-Insert> <C-V>
endif
