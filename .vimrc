set nocompatible
let t_Co=256

set guioptions=aAce
set guifont=Menlo:h13
" Pathogen
call pathogen#runtime_append_all_bundles()

" Change the leader to ,
let mapleader = ","

set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set textwidth=79  " wrap lines at 79 characters
set relativenumber
au BufReadPost * set relativenumber " hack to load relative number on all buffers
set wildmenu
set wildmode=longest,list
set cursorline

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set expandtab

colorscheme sjl-molokai

inoremap jj <ESC>

" Turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Remap : to ;
nnoremap ; :

" Save on lose focus
" au FocusLost * :wa

" Run Python script through PEP8
map <buffer> <leader>p :w<CR>:!pep8 % <CR>

" taglist toggle
let Tlist_Ctags_Cmd="/Users/norex/Downloads/ctags-5.8/ctags"
nnoremap tt :TlistToggle<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open a new split and switch to it
nnoremap <leader>w <C-w>v<C-w>1

" Simple clearing of search results
nmap <silent> ,/ :nohlsearch<CR>

" Bounce between brackets using <tab> instead of %
nnoremap <tab> %

" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" HTML tag folding
nnoremap <leader>ft Vatzf

" Toggle whitespace characters
nmap <leader>l :set list!<cr>

" Diplay cursor position in bottom right corner
set ruler

" Editing .vimrc
map <leader>v :vs ~/.vimrc<CR><C-W>
map <silent> <leader>V :source ~/.vimrc<CR>

" Editing .bashrc
map <leader>b :vs ~/.bashrc<CR><C-W>

" Quick window resizing
if bufwinnr(1)
  map + <C-W>>
  map - <C-W><
endif

au BufNewFile,BufRead *.html setlocal filetype=htmldjango

let g:syntastic_enable_signs=1
let g:snips_author="Honza Pokorny"

" Status line stuff
set statusline=%F%m%r%h%w%=%{fugitive#statusline()}%y\[%l\/%L,%c]
set laststatus=2

set scrolloff=3

" CommandT
nmap <leader>f :CommandTFlush<CR>
