" General Behavior
set directory=$HOME/.vim/swapfiles//
set nobackup
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

" Mouse
set mouse=a " Mouse support everywhere
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
nnoremap <leader>m :set mouse=a<cr>
nnoremap <leader>M :set mouse=<cr>

" Indentation
set tabstop=4
set shiftwidth=4
set noexpandtab " Use tabs instead of spaces
filetype plugin indent on

" Wrapping
set nolist  " list disables linebreak
set wrap
set linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=t

" CUA Keys
vnoremap <c-x> "+x
vnoremap <c-c> "+y
inoremap <c-v> <c-o>"+gP

" Netrw File Explorer (if not using NERDTree)
let g:netrw_liststyle=3 " Tree Listing
let g:netrw_list_hide='^\..*$' " Hide Dotfiles
let g:netrw_hide=1 " Activate Hiding
let g:netrw_browse_split=4 " Open in Last Window
let g:netrw_use_errorwindow=0 " Disable Error Window 

" Toggle Line Numbers
nnoremap <leader># :set nu!<cr>

" Insert Timestamp
nnoremap <leader>it :r! date<cr>

" Look Up Word Under Cursor in Dictionary
nnoremap <leader>ld :!dict -d wn <cword><cr>

" tmux Integration
function! TmuxCD(target)
	execute "silent !tmux send-keys -t " . a:target . " \"cd $(dirname " . expand("%:p") . ")\" C-m"
	execute "redraw!"
endfunction
command! -nargs=1 TmuxCD call TmuxCD(<f-args>)
nnoremap <leader>tw :TmuxCD 

" Autocommands
augroup indentation
    autocmd!
    autocmd BufNewFile,BufRead *.{rb,scala} setlocal shiftwidth=2
    autocmd BufNewFile,BufRead *.{rb,scala,java} setlocal expandtab
augroup END

" Pathogen
runtime! autoload/pathogen.vim
if exists("*pathogen#infect")
	call pathogen#infect()
endif

