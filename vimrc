set nocompatible

" Silence please
set vb
set t_vb=

" Change the leader to ,
let mapleader = ","
let maplocalleader = "\\"

set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
set ttyfast
set lazyredraw
set splitbelow
set splitright
set title
set completeopt=longest,menuone,preview
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
" set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set textwidth=79  " wrap lines at 79 characters
set relativenumber
set number
set autoread      " Reload the files if they changed on disk!
set shell=bash

" wild menu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=_build                           " Sphinx build dir
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store
set wildignore+=*.rdb                            " Redis database file
set wildignore+=*CACHE                           " django compressor cache

" Two spaces to end a sentence
set cpoptions+=J

" TODO: Only add the 73 to Python files
set colorcolumn=80,73

set cursorline
set nojoinspaces

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

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

" Fix syntax highlighting
nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open a new split and switch to it
nnoremap <leader>w <C-w>v<C-w>1

" Simple clearing of search results
:nnoremap <CR> :nohlsearch<cr>

" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" HTML tag folding
nnoremap <leader>ft Vatzf

" Toggle whitespace characters
nmap <leader>l :set list!<cr>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" Diplay cursor position in bottom right corner
set ruler

" Editing .vimrc
map <leader>v :vs ~/.vimrc<CR><C-W>
map <silent> <leader>V :source ~/.vimrc<CR>

" Editing .bashrc
map <leader>b :vs ~/.bashrc<CR><C-W>

au FileType javascript setlocal tabstop=2 shiftwidth=2

au FileType coffee setlocal tabstop=4 shiftwidth=4

au BufNewFile,BufRead *.html setlocal filetype=htmldjango
au FileType htmldjango setlocal textwidth=0 tabstop=2 shiftwidth=2

au FileType mail setlocal textwidth=72

au FileType c setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab cindent

" Open help files in a vertical split
au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif

let g:snips_author="Honza Pokorny"

" Status line stuff
set statusline=%F   " Full path to file
set statusline+=%h  " Help buffer flag, e.g. [Help]
set statusline+=%m  " Modified flag
set statusline+=%r  " Read only flag
set statusline+=%w  " Preview window flag
set statusline+=%=%{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\\"}%k\%=
set statusline+=%y\[%l\/%L,%c] " file type, line num, num lines, col num
set laststatus=2
set scrolloff=3

" Don't display manual
nnoremap K <nop>

" Make vim able to edit crontab
set backupskip=/tmp/*,/private/tmp/*"

" Keep splits sized properly
au VimResized * exe "normal! \<cw>="

" Uppercase
nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Format
nnoremap Q gqip

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



" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Toggle paste
set pastetoggle=<F9>

syntax enable
set background=dark
