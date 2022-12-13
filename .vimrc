" -- plugin management --

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together
let g:ale_disable_lsp = 1

" Manage thyself!
Plugin 'VundleVim/Vundle.vim'

" color themes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'romainl/Apprentice'
Plugin 'sainnhe/everforest'
Plugin 'jacoborus/tender.vim'
Plugin 'ackyshake/Spacegray.vim'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'hardselius/warlock'
Plugin 'Softmotions/vim-dark-frost-theme'
Plugin 'axvr/raider.vim'
Plugin 'axvr/photon.vim'
Plugin 'neg-serg/neg.nvim'
Plugin 'brentlintner/twilighted.vim'

" Make themes work with transparent bg
Plugin 'tribela/vim-transparent'

" multi lang syntax support
Plugin 'sheerun/vim-polyglot'

" shows which lines have been added, modified, or removed
Plugin 'airblade/vim-gitgutter'

" support for EditorConfig
Plugin 'editorconfig/editorconfig-vim'

" highlighting of keywords vs values, warnings, and quote concealing
Plugin 'elzr/vim-json'

" make gvim-only colorschemes work transparently in terminal
Plugin 'godlygeek/csapprox'

" css/less/sass/html color preview
Plugin 'gorodinskiy/vim-coloresque'

" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'ctrlpvim/ctrlp.vim'

" support creating gists from buffers
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" support for Ack
Plugin 'mileszs/ack.vim'

" highlight trailing whitespace characters
Plugin 'ntpeters/vim-better-whitespace'

" auto comment support
Plugin 'scrooloose/nerdcommenter'

" file system explorer
Plugin 'scrooloose/nerdtree'

" helps to end certain code structures automatically
Plugin 'tpope/vim-endwise'

" change surrounding quotes, etc
Plugin 'tpope/vim-surround'

" run tests for Ruby
Plugin 'kurko/smartest.vim'

" code snippets
"Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" smart lookups
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }

" better terminal
" Plugin 'kassio/neoterm'

" auto linting
Plugin 'dense-analysis/ale'

" markdown plugin
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" git integration (blame, etc)
Plugin 'tpope/vim-fugitive'

call vundle#end()

" -- main config --

set shell=/bin/zsh
"set shell=/usr/bin/zsh
"set shell='cmd.exe'

" color and syntax settings
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer',
                            \ 'StatusLine', 'StatusLineNC' ]
let g:transparent_groups += ['Pmenu']
let g:transparent_groups += ['CtrlPMode1', 'CtrlPMode2', 'CtrlPStats'] " CtrlP
let g:transparent_groups += ['NormalFloat'] " coc.nvim
syntax on
set t_Co=256
set termguicolors
set background=dark
colorscheme everforest
hi Normal guibg=NONE ctermbg=NONE

set nowrap

set wildignore+=*/build/,*/storage/*,*/.build/*,coverage_js/*,*/public/*,*.idea*,*.gradle/*,*/dist/*,*android/build/*,*app/build/*,*build/lib*,*vendor/*,*.docs*,*/.test*,*.tscache*,*.git/*,*node_modules/*,*bower_components/*,*.vim/bundle,*tmp/*,*.cabal-sandbox/*,*.keep

" ctrl-p
" TODO: clear cache on pull up? map new key?
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = {
            \   'dir' : '\.test|node_modules|\.git$|\.hg$|\.svn$',
            \   'file': '',
            \ }
nnoremap <silent> <C-n> :CtrlPBuffer<CR>
nnoremap <silent> <C-b> :CtrlPTag<CR>

let g:python3_host_prog = '/usr/bin/python3'
let g:pip3_host_prog = '/usr/bin/pip3'

" CoC settings
let g:coc_global_extensions=[
        \ 'coc-tsserver',
        \ 'coc-solargraph',
        \ 'coc-phpls',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-vetur',
        \ 'coc-flutter',
        \ 'coc-vimlsp',
        \ 'coc-go',
    \]
" TODO: map tab to complete (else tab)?
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" git gutter
let g:gitgutter_set_sign_backgrounds = 0
hi SignColumn guibg=NONE ctermbg=NONE
hi ALEErrorSign guibg=NONE ctermbg=NONE
hi ALEWarningSign guibg=NONE ctermbg=NONE

let g:ale_linters = {
\}

" speed up vue plugin
let g:vue_disable_pre_processors = 1

" disable optional perl module
let g:loaded_perl_provider = 0

" set snippet keys
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" enable clipboard
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" use silver searcher underneath ack.vim
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column --ignore node_modules --ignore deployment --ignore vendor --ignore coverage --ignore storage --ignore dist --ignore "*.lock" --ignore build --ignore package-lock.json'
command! -nargs=1 Ag Ack <args>
command! -nargs=1 -complete=file -bar Acks Ag! <args>|cw
nmap <leader>g :Ag<space>

" disable vim-markdown folder
let g:vim_markdown_folding_disabled=1

" gist-vim
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

set backspace=indent,eol,start " backspacing support

set nofoldenable " Disable folding

" Fast saving (\w)
nmap <leader>w :wa<cr>

" Fast edit snippets (\w)
nmap <leader>S :UltiSnipsEdit<cr>

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
"set nowrap

" Allow switching between buffers without saving .
set hidden

" Show hybrid line numbers except when out of focus or in Insert
:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Set xterm title.
set title

" Highlight char when over textwidth
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 120)

" Indentation settings..
set autoindent
filetype plugin indent on
set expandtab

" Map space to search
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

" Show git blame
nmap <leader>b :Git<space>blame<CR>

" window and neoterm commands
" TODO: use leader vs C where possible
nmap <C-c> :close<CR>
"nmap <leader>z :TcloseAll! \| :T<space>
nmap <leader>d :bd<CR>
"nmap <leader>C :TcloseAll!<CR>
"nmap <leader>t :TcloseAll! \| :T npm t %<cr>
"nmap <leader>T :TcloseAll! \| :T ./vendor/bin/phpunit %<cr>
"let g:neoterm_default_mod = 'botright'

" Clear whitespace
let g:better_whitespace_enabled=1

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
nnoremap <leader><space> :let @/ = ""<CR>
nnoremap <leader><s> :let @/ = ""<CR>

" highlighting aliases
au BufRead,BufNewFile *.plist set filetype=xml

" if on Windows Terminal
" nnoremap <c-z> <nop>

if !has('nvim')
    " Need +virtualedit to paste in insert mode.
    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
    imap <S-Insert> <C-V>
    vmap <S-Insert> <C-V>
endif
