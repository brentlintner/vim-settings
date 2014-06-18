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
" Don't wrap

set nowrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set xterm title.

set title

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom file extensions..

au! BufRead,BufNewFile Jakefile     setfiletype javascript
au! BufRead,BufNewFile *.mustache   setfiletype mustache
au! BufRead,BufNewFile *.less       setfiletype less

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation settings..

set autoindent
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType ruby set tabstop=2|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2
autocmd FileType less set tabstop=2|set shiftwidth=2
autocmd FileType css set tabstop=2|set shiftwidth=2
autocmd FileType stylus set tabstop=2|set shiftwidth=2
autocmd FileType html set tabstop=2|set shiftwidth=2
autocmd FileType mustache set tabstop=2|set shiftwidth=2
autocmd FileType coffee set tabstop=2|set shiftwidth=2
autocmd FileType jade set tabstop=2|set shiftwidth=2
autocmd FileType text setlocal textwidth=78 " for git commits
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)

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
"  NERD Tree Commands

nnoremap <silent> <C-e><C-f> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Tag List Commands

nnoremap <silent> <C-e><C-t> :TlistToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  FuzzyFinder Commands, etc.

let g:fuf_modesDisable = []
let g:fuf_abbrevMap = {
    \   '^vr:' : map(filter(split(&runtimepath, ','), 'v:val !~ "after$"'), 'v:val . ''/**/'''),
    \   '^m0:' : [ '/mnt/d/0/', '/mnt/j/0/' ],
    \ }
let g:fuf_mrufile_maxItem = 300
let g:fuf_mrucmd_maxItem = 400
nnoremap <silent> <C-n>      :FufBuffer<CR>
nnoremap <silent> <C-p>      :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
nnoremap <silent> <C-f>p     :FufFile<CR>
nnoremap <silent> <C-f><C-d> :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <C-f>d     :FufDirWithFullCwd<CR>
nnoremap <silent> <C-f>D     :FufDir<CR>
nnoremap <silent> <C-b>      :FufBookmark<CR>
nnoremap <silent> <C-f><C-t> :FufTag<CR>
nnoremap <silent> <C-f>t     :FufTag!<CR>
noremap  <silent> g]         :FufTagWithCursorWord!<CR>
nnoremap <silent> <C-f><C-f> :FufTaggedFile<CR>
nnoremap <silent> <C-f><C-j> :FufJumpList<CR>
nnoremap <silent> <C-f><C-g> :FufChangeList<CR>
nnoremap <silent> <C-f><C-q> :FufQuickfix<CR>
nnoremap <silent> <C-f><C-l> :FufLine<CR>
nnoremap <silent> <C-f><C-h> :FufHelp<CR>
nnoremap <silent> <C-f><C-b> :FufAddBookmark<CR>
vnoremap <silent> <C-f><C-b> :FufAddBookmarkAsSelectedText<CR>
nnoremap <silent> <C-f><C-e> :FufEditInfo<CR>
nnoremap <silent> <C-f><C-r> :FufRenewCache<CR>

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
" Comment out selected lines (with JS comments)
" TODO: figure out how to do with current filetype's comment

map <leader>g :s/^/\/\//<CR> :silent noh<CR>
map <leader>G :s/^\/\///<CR> :silent noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck en_CA

map <leader>s :setlocal spell spelllang=en_ca<CR>
map <leader>S :setlocal nospell<CR>

" Load in a custom config in CWD?
if filereadable(".vim.custom")
    so .vim.custom
endif
