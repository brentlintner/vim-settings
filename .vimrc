" -- plugin management --

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Manage thyself!
Plugin 'VundleVim/Vundle.vim'

" theme akin to TextMate's twilight theme + translucent bg
Plugin 'brentlintner/twilighted.vim'

" A dark colorscheme for Vim
Plugin 'mhinz/vim-janah'

" A dark Vim/Neovim color scheme
Plugin 'joshdick/onedark.vim'

" Dark+ inspired theme
Plugin 'tomasiser/vim-code-dark'

" shows which lines have been added, modified, or removed
Plugin 'airblade/vim-gitgutter'

" syntax highlighting and other scripts for Haskell
Plugin 'dag/vim2hs'

" syntax highlighting for RDoc
Plugin 'depuracao/vim-rdoc'

" support for Scala
Plugin 'derekwyatt/vim-scala'

" syntax highlighting for Pug (formerly Jade)
Plugin 'digitaltoad/vim-jade'

" support for EditorConfig
Plugin 'editorconfig/editorconfig-vim'

" highlighting of keywords vs values, warnings, and quote concealing
Plugin 'elzr/vim-json'

" syntax checking (fork that includes syntax checkers that use ferret)
Plugin 'forthright/syntastic'

" make gvim-only colorschemes work transparently in terminal
Plugin 'godlygeek/csapprox'

" css/less/sass/html color preview
Plugin 'gorodinskiy/vim-coloresque'

" syntax highlighting, indenting and autocompletion for LESS
Plugin 'groenewege/vim-less'

" improved syntax highlighting for Go
Plugin 'fatih/vim-go'

" syntax highlighting for CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'ctrlpvim/ctrlp.vim'

" syntax highlighting support for TypeScript
Plugin 'leafgarland/typescript-vim'

" support creating gists from buffers
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" support for Ack
Plugin 'mileszs/ack.vim'

" highlight trailing whitespace characters
Plugin 'ntpeters/vim-better-whitespace'

" syntax highlighting and improved indentation for JavaScript
Plugin 'pangloss/vim-javascript'

" React JSX syntax highlighting and indenting for vim
Plugin 'mxw/vim-jsx'

" syntax highlighting etc for php
Plugin 'StanAngeloff/php.vim'

" syntax highlighting for blade
Plugin 'jwalton512/vim-blade'

" syntax highlighting for QML
Plugin 'peterhoeg/vim-qml'

" syntax highlighting and more for Markdown
Plugin 'plasticboy/vim-markdown'

" syntax highlighting and indenting for PowerShell
Plugin 'PProvost/vim-ps1'

" auto comment support
Plugin 'scrooloose/nerdcommenter'

" file system explorer
Plugin 'scrooloose/nerdtree'

" visualize your Vim undo tree
Plugin 'sjl/gundo.vim'

" syntax highlighting for Slim
Plugin 'slim-template/vim-slim'

" helps to end certain code structures automatically
Plugin 'tpope/vim-endwise'

" syntax and indenting for git files
Plugin 'tpope/vim-git'

" syntax highlighting for Sass, Haml and Sass
Plugin 'tpope/vim-haml'

" enhanced syntax highlighting for Rails
Plugin 'tpope/vim-rails'

" change surrounding quotes, etc
Plugin 'tpope/vim-surround'

" syntax highlighting etc for Ruby
Plugin 'vim-ruby/vim-ruby'

" syntax highlighting for Stylus
Plugin 'wavded/vim-stylus'

" run tests for Ruby
Plugin 'kurko/smartest.vim'

" auto md table tabbing
Plugin 'godlygeek/tabular'

" code snippets
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" syntax support for Docker
Plugin 'docker/docker', { 'rtp': '/contrib/syntax/vim' }

" syntax for .vue files
Plugin 'posva/vim-vue'

" smart lookups
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }

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

set wildignore+=*/build/,*/.build/*,*/public/*,*.idea*,*.gradle/*,*/dist/*,*android/build/*,*app/build/*,*build/lib*,*vendor/*,*.docs*,*/.test*,*.tscache*,*.git/*,*node_modules/*,*coverage/*,*bower_components/*,*.vim/bundle,*tmp/*,*.cabal-sandbox/*,*.keep

" ctrl-p
" TODO: clear cache on pull up? map new key?
"let g:ctrlp_user_command = 'ag -i -l -G %s --nogroup --nocolor --column --ignore node_modules --ignore coverage --ignore dist --ignore "*.lock" --ignore "\/build\/" --ignore package-lock.json .'
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

" speed up vue plugin
let g:vue_disable_pre_processors = 1

" set snippet keys
let g:UltiSnipsExpandTrigger="<tab>"

" enable clipboard
set clipboard=unnamedplus

" use silver searcher underneath ack.vim
let g:ackprg = 'ag -i --nogroup --nocolor --column --ignore node_modules --ignore coverage --ignore dist --ignore "*.lock" --ignore build --ignore package-lock.json'

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

" Close window
nmap <C-w>c :close<CR>

" Clear whitespace
nmap <C-w>p :StripWhitespace<CR>

" Command to toggle syntastic passive mode
nnoremap <C-w>e :SyntasticCheck<CR>
nnoremap <C-w>E :SyntasticReset<CR>

" Statusline
" %F(Full file path)
" %m(Shows + if modified - if not modifiable)
" %r(Shows RO if readonly)
" %<(Truncate here if necessary)
" \ (Separator)
" %=(Right align)
" %l(Line number)
" %v(Column number)
" %L(Total number of lines)
" %p(How far in file we are percentage wise)
" %%(Percent sign)
" Recommended statusline (see :help syntastic)
set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Change the highlighting so it stands out
"hi statusline ctermbg=white ctermfg=black

" Make sure it always shows
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 0
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 0

" Put into passive mode, and set desired checkers
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers=['mri', 'vile_rubocop', 'vile_rails_best_practices', 'vile_rubycritic']
let g:syntastic_typescript_checkers=['vile_tslint']
let g:syntastic_javascript_checkers=['vile_eslint']
let g:syntastic_slim_checkers=['vile_slim_lint', 'vile_rails_best_practices']
let g:syntastic_haskell_checkers=['vile_hlint']
let g:syntastic_sass_checkers=['vile_sass_lint']
let g:syntastic_coffee_checkers=['coffee', 'vile_coffeelint' ]

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
