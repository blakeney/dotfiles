" PLUGINS
" Use the :PlugInstall command to install new plugins
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Sensible defaults and behavior tweaks
Plug 'tpope/vim-sensible'
Plug 'moll/vim-bbye'

" Solarized Color Scheme
Plug 'altercation/vim-colors-solarized'

" File Explorer (Better than built-in netrw)
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Language Server Support
" While editing a language file, run :LspInstallServer to install a server
" To uninstall a server, run :LspUninstallServer server-name
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Build Tool Support
Plug 'hdiniz/vim-gradle'
Plug 'timonv/vim-cargo'

" Project Support
Plug 'airblade/vim-rooter'

" Other
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-fugitive'
Plug 'maxbrunsfeld/vim-emacs-bindings'

call plug#end()


" LOCAL CUSTOMIZATIONS

" Appearance
if has('gui_running')
  colorscheme solarized
  set background=dark
endif

" General Behavior
if empty(glob('~/.vim/swapfiles'))
  call mkdir($HOME . "/.vim/swapfiles", "p", 0700)
endif
set directory=$HOME/.vim/swapfiles// " Swap file location
set nobackup " Suppress backup files
set hidden " Allow moving away from modified buffer
set smartcase " Case insensitve search unless query includes capital letters
let mapleader=" "
set wildcharm=<C-z> " Use C-z to simulate tab in keybindings

" Shortcuts
nnoremap <leader>fe :NERDTreeToggle<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>w <C-w>
nnoremap <leader>bb :b 
nnoremap <leader>bl :b <C-z>
nnoremap <leader>bd :Bdelete<cr>
nnoremap <leader>bD :bufdo :Bdelete
nnoremap <leader>sc :e ~/.vimrc<cr>
nnoremap <leader>ss :source %<cr>

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

" Mouse
set mouse=a " Mouse support everywhere
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
nnoremap <leader>m :set mouse=a<cr>
nnoremap <leader>M :set mouse=<cr>

" Language Servers
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
nnoremap <leader>ld :LspDefinition<cr>
nnoremap <leader>lN :LspPreviousDiagnostic<cr>
nnoremap <leader>ln :LspNextDiagnostic<cr>
nnoremap <leader>lr :LspReferences<cr>
nnoremap <leader>lR :LspRename<cr>
nnoremap <leader>lt :LspTypeHierarchy<cr>
nnoremap <leader>lh :LspHover<cr>

" Build Tools
augroup compilers
	autocmd!
	autocmd BufNewFile,BufRead *.{java,scala,groovy} nnoremap <leader>mb :Gradle assemble<cr>
	autocmd BufNewFile,BufRead *.{java,scala,groovy} nnoremap <leader>mt :Gradle test<cr>

	autocmd BufNewFile,BufRead *.{rs} compiler cargo
	autocmd BufNewFile,BufRead *.{rs} nnoremap <leader>mb :CargoBuild<cr>
	autocmd BufNewFile,BufRead *.{rs} nnoremap <leader>mt :CargoTest<cr>
augroup END

" Version Control
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gcc :Git commit<cr>
nnoremap <leader>gca :Git commit --amend<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gri :Git rebase -i<cr>
nnoremap <leader>gf :Git pull --rebase<cr>
nnoremap <leader>gp :Git push<cr>

" Project Support
let g:rooter_silent_chdir = 1 " Silence vim-rooter

" Toggle Line Numbers
nnoremap <leader># :set nu!<cr>

" Insert Timestamp
nnoremap <leader>it :r! date<cr>

