" Load pathogen
source ~/.vim/bundle/pathogen/autoload/pathogen.vim

set nocompatible

set guioptions=aAce
set guifont=Menlo:h12

" Pathogen
call pathogen#runtime_append_all_bundles()

" Change the leader to ,
let mapleader = ","
let maplocalleader = "\\"

set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
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
set wildmenu
set wildmode=longest,list
set wildignore+=*.pyc,.git
set cursorline
set nojoinspaces

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set expandtab

if has('mouse')
    set mouse=a
endif

nnoremap j gj
nnoremap k gk

" Remap : to ;
nnoremap ; :

" Save on lose focus
au FocusLost * :wa

" Run Python script through PEP8
map <buffer> <leader>p :w<CR>:!pep8 % <CR>

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

au FileType javascript setlocal tabstop=2 shiftwidth=2

au FileType coffee setlocal tabstop=2 shiftwidth=2

au BufNewFile,BufRead *.html setlocal filetype=htmldjango
au FileType htmldjango setlocal textwidth=0

au BufNewFile,BufRead *.j setlocal filetype=objj
let g:syntastic_enable_signs=1

let g:snips_author="Honza Pokorny"

" Status line stuff
set statusline=%F%m%r%h%w%=%{fugitive#statusline()}%y\[%l\/%L,%c]
set laststatus=2

set scrolloff=3

" CommandT
nmap <leader>f :CommandTFlush<CR>
let g:CommandTMaxHeight=20

" tagbar
let g:tagbar_sort = 0
nmap <leader>d :TagbarToggle<CR>

" Don't displal manual
nnoremap K <nop>

au Filetype rst nnoremap <buffer> <localleader>1 yypVr=
au Filetype rst nnoremap <buffer> <localleader>2 yypVr-
au Filetype rst nnoremap <buffer> <localleader>3 yypVr~
au Filetype rst nnoremap <buffer> <localleader>4 yypVr`

" Substitute
nnoremap <leader>s :%s//g<left><left>

function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:tally += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun

command! -nargs=* Only call CloseHiddenBuffers()

nmap \ <Plug>CommentaryLine

set background=dark
colorscheme solarized
syntax enable
