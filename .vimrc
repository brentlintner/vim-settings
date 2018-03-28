" keep it awesome- custom file warrants this
set nocompatible

" -- plugins --

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'brentlintner/twilighted.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'dag/vim2hs'
Plugin 'depuracao/vim-rdoc'
Plugin 'derekwyatt/vim-scala'
Plugin 'digitaltoad/vim-jade'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elzr/vim-json'
Plugin 'forthright/syntastic'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/csapprox'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'gregsexton/MatchTag'
Plugin 'groenewege/vim-less'
Plugin 'isRuslan/vim-es6'
Plugin 'jamescarr/snipmate-nodejs'
Plugin 'jnurmine/Zenburn'
Plugin 'jnwhiteh/vim-golang'
Plugin 'juvenn/mustache.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'peterhoeg/vim-qml'
Plugin 'plasticboy/vim-markdown'
Plugin 'PProvost/vim-ps1'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/vimproc.vim'
Plugin 'sjl/gundo.vim'
Plugin 'slim-template/vim-slim'
Plugin 'spf13/vim-colors'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'wavded/vim-stylus'
Plugin 'xolox/vim-misc'

call vundle#end()

" -- main config --

" enable clipboard
set clipboard=unnamedplus

" disable vim-markdown folder
let g:vim_markdown_folding_disabled=1

" gist-vim
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

" ctrl-p
" TODO: clear cache on pull up? map new key?
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
set wildignore+=*vendor/*,*.docs*,*.test*,*.tscache*,*.git/*,*node_modules/*,*coverage/*,*bower_components/*,*.vim/bundle,*tmp/*,*.cabal-sandbox/*,*.keep
let g:ctrlp_custom_ignore = '\v[\/](\.build|\.test|dist|\.git|\.hg|\.svn)$'
nnoremap <silent> <C-n> :CtrlPBuffer<CR>
nnoremap <silent> <C-b> :CtrlPTag<CR>

" color and syntax settings
set background=dark
syntax on
set t_Co=256
colors twilighted

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
call matchadd("ColorColumn", '\%81v', 80)

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
let g:typescript_compiler_binary = 'npm run -s tsc'
let g:typescript_compiler_options = ''
"let g:tsuquyomi_disable_quickfix = 1
"let g:typescript_indent_disable = 1

" Tabbing shortcuts
nmap <leader>t :tabclose<CR>

" Close window
nmap <C-w>c :close<CR>

" Command to toggle syntastic passive mode
nnoremap <C-w>e :SyntasticCheck<CR>
nnoremap <C-w>E :SyntasticReset<CR>

" Recommended statusline (see :help syntastic)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 0
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 0

" Put into passive mode, and set desired checkers
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_ruby_checkers=["mri", "vile_rubocop", "vile_rails_best_practices", "vile_rubycritic"]
let g:syntastic_typescript_checkers=["vile_tslint"]
let g:syntastic_javascript_checkers=["vile_eslint"]
let g:syntastic_slim_checkers=["vile_slim_lint", "vile_rails_best_practices"]
let g:syntastic_haskell_checkers=["vile_hlint"]
let g:syntastic_sass_checkers=["vile_sass_lint"]
let g:syntastic_coffee_checkers=["coffee", "vile_coffeelint" ]

" Resize windows
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>= :vertical resize +5<CR>

" Tagbar
nnoremap <C-w>b :TagbarToggle<CR>

"  NERD Tree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.baseDir.ts$']
nnoremap <silent> <C-e><C-f> :NERDTreeToggle<CR>

" Spellcheck en_CA
nnoremap <C-w>s :setlocal spell spelllang=en_ca<CR>
nnoremap <C-w>S :setlocal nospell<CR>

" Clear search
nnoremap <C-w><space> :let @/ = ""<CR>

" Gundo shortcut
nnoremap <C-w>g :GundoToggle<CR>

" Run :make
nnoremap <C-w>m :make<CR>

" Load in a custom config in CWD?
if filereadable(".vim.custom")
    so .vim.custom
endif

if !has('nvim')
    " Need +virtualedit to paste in insert mode.
    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
    imap <S-Insert> <C-V>
    vmap <S-Insert> <C-V>
endif
