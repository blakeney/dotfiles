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
"colorscheme nightforest

" Mouse
set mouse=a " Mouse support everywhere
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

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

" Netrw File Explorer -- No Longer Used
"nnoremap <c-n> :20Vexplore<cr>
let g:netrw_liststyle=3 " Tree Listing
let g:netrw_list_hide='^\..*$' " Hide Dotfiles
let g:netrw_hide=1 " Activate Hiding
let g:netrw_browse_split=4 " Open in Last Window
let g:netrw_use_errorwindow=0 " Disable Error Window 

" Shortcut to Toggle Line Numbers in Current Buffer
nnoremap <leader># :set nu!<cr>

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

" Plugins
" Pathogen
execute pathogen#infect()
Helptags " Needed to generate help for plugins
" bbye
nnoremap <leader>dd :Bdelete<cr>
nnoremap <leader>da :bufdo :Bdelete<cr>
" MiniBufExpl (Fork by fholgado)
nnoremap <leader>b :MBEToggle<cr>
nnoremap <c-h> :MBEbp<cr>
nnoremap <c-l> :MBEbn<cr>
" NERD Tree
nnoremap <leader>f :NERDTreeToggle<cr>
let g:NERDTreeDirArrows = 0
" Fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gpull<cr>
nnoremap <leader>gu :Gpush<cr>
nnoremap <leader>gca :Gcommit -a<cr>
nnoremap <leader>gcc :Gcommit<cr>
" Syntastic
nnoremap <leader>c :SyntasticCheck<cr>
let g:syntastic_mode_map = {"mode":"passive", "active_filetypes":[], "passive_filetypes":["sbt"]}
" Maven (via maven-compiler)
augroup maven
	autocmd!
	autocmd Filetype java compiler mvn
	autocmd Filetype pom compiler mvn
augroup END
nnoremap <leader>mc :make compile<cr>
nnoremap <leader>mt :make test<cr>
nnoremap <leader>mp :make compile test assembly:single<cr>
nnoremap <leader>me :make eclipse:clean eclipse:eclipse<cr>
" SBT (via vim-scala)
augroup sbt
	autocmd!
	autocmd Filetype scala compiler sbt
	autocmd Filetype sbt compiler sbt
augroup END
