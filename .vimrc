" -- plugin management --

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Manage thyself!
Plugin 'VundleVim/Vundle.vim'

" theme akin to TextMate's twilight theme + translucent bg
Plugin 'brentlintner/twilighted.vim'

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
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" smart lookups
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }

" better terminal
Plugin 'kassio/neoterm', { 'branch': 'release' }

" auto linting
Plugin 'dense-analysis/ale'

" markdown plugin
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" git integration (blame, etc)
Plugin 'tpope/vim-fugitive'

call vundle#end()

" -- main config --

set shell=/usr/bin/zsh

" color and syntax settings
syntax on
set t_Co=256
colorscheme twilighted
hi Normal guibg=NONE ctermbg=NONE

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

" CoC settings
let g:coc_global_extensions=[
        \ 'coc-tsserver',
        \ 'coc-solargraph',
        \ 'coc-phpls',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-vetur',
        \ 'coc-vimlsp',
        \ 'coc-omnisharp'
    \]
" TODO: map tab to complete (else tab)?
inoremap <silent><expr> <c-n> coc#refresh()
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
\   'sh': [],
\}

" speed up vue plugin
let g:vue_disable_pre_processors = 1

" set snippet keys
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" enable clipboard
set clipboard=unnamedplus

" use silver searcher underneath ack.vim
let g:ackprg = 'ag -i --nogroup --nocolor --column --ignore node_modules --ignore vendor --ignore coverage --ignore storage --ignore dist --ignore "*.lock" --ignore build --ignore package-lock.json'
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
"set nowrap

" Allow switching between buffers without saving .
set hidden

" Always show line numbers.
set number

" Set xterm title.
set title

" Highlight char when over textwidth
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 120)

" Indentation settings..
set autoindent
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType vim set tabstop=4|set shiftwidth=4
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

" Show git blame
nmap <leader>b :Git<space>blame<CR>

" window and neoterm commands
" TODO: use leader vs C where possible
nmap <C-c> :close<CR>
nmap <leader>z :TcloseAll! \| :T<space>
nmap <leader>d :bd<CR>
nmap <leader>C :TcloseAll!<CR>
nmap <leader>t :TcloseAll! \| :T npm t %<cr>
nmap <leader>T :TcloseAll! \| :T ./vendor/bin/phpunit %<cr>
let g:neoterm_default_mod = 'botright'

" Clear whitespace
nmap <C-w>p :StripWhitespace<CR>
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

" Gundo shortcut
nnoremap <C-w>g :GundoToggle<CR>

if !has('nvim')
    " Need +virtualedit to paste in insert mode.
    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
    imap <S-Insert> <C-V>
    vmap <S-Insert> <C-V>
endif
