" General Behavior
set autochdir
set autoindent
set backspace=indent,eol,start
set incsearch
set ignorecase
set smartcase " Case insensitve search unless query includes capital letters
set hidden " Allow moving away from modified buffer
set tags=./.tags;
let mapleader=","

" Appearance
syntax on
set hlsearch
set ruler
set guifont=Monospace\ 11
set background=dark
colorscheme solarized

" Mouse
set mouse=a " Mouse support everywhere
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab " Use spaces instead of tabs
filetype plugin indent on

" CUA Keys
vnoremap <c-x> "+x
vnoremap <c-c> "+y
inoremap <c-v> <c-o>"+gP

" Netrw File Explorer
nnoremap <c-l> :20Vexplore<cr>
let g:netrw_liststyle=3 " Tree Listing
let g:netrw_list_hide='^\..*$' " Hide Dotfiles
let g:netrw_hide=1 " Activate Hiding
let g:netrw_browse_split=4 " Open in Last Window
let g:netrw_use_errorwindow=0 " Disable Error Window 

" Command to Close Buffer without Closing Window
command! Bd bp | bd #

" Shortcut to Toggle Line Numbers in Current Buffer
nnoremap <leader># :set nu!<cr>

" Eclim Shortcuts
nnoremap <c-j>c :JavaCorrect<cr>
nnoremap <c-j>d :JavaDocComment<cr>
nnoremap <c-j>v :Validate<cr>

" Autocommands
augroup indentation
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal noexpandtab
    autocmd BufNewFile,BufRead *.rb setlocal shiftwidth=2
    autocmd BufNewFile,BufRead *.scala setlocal shiftwidth=2
augroup END
