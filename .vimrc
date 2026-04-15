vim9script

# =========================
# Core behavior
# =========================
set nocompatible
g:mapleader = ' '

set hidden
set mouse=a
set smartcase
set ignorecase
set wrap
set linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=t
set wildcharm=<C-z>
set nobackup
set undofile
set clipboard=unnamedplus
set background=dark

# Swap / undo dirs
var swapdir = expand('~/.vim/swapfiles')
var undodir = expand('~/.vim/undodir')

if !isdirectory(swapdir)
  mkdir(swapdir, 'p', 0o700)
endif
if !isdirectory(undodir)
  mkdir(undodir, 'p', 0o700)
endif

execute 'set directory=' .. fnameescape(swapdir) .. '//'
execute 'set undodir=' .. fnameescape(undodir) .. '//'

# tmux / screen mouse quirk
if &term =~ '^screen'
  set ttymouse=xterm2
endif

# =========================
# Keymaps
# =========================
nnoremap <leader>fs <Cmd>write<CR>
nnoremap <leader>w  <C-w>
nnoremap <leader>bb <Cmd>buffer<Space>
nnoremap <leader>bl :buffer <C-z>
nnoremap <leader>bd <Cmd>bdelete<CR>
nnoremap <leader>bD <Cmd>bufdo bdelete<CR>
nnoremap <leader>sc <Cmd>edit $MYVIMRC<CR>
nnoremap <leader>ss <Cmd>source %<CR>

# Netrw instead of NERDTree
nnoremap <leader>fe <Cmd>Lexplore<CR>

# Toggle line numbers
nnoremap <leader># <Cmd>set number!<CR>

# Mouse toggle
nnoremap <leader>m <Cmd>set mouse=a<CR>
nnoremap <leader>M <Cmd>set mouse=<CR>

# Insert timestamp
nnoremap <leader>it <Cmd>read !date<CR>

# =========================
# Clipboard-style keys
# =========================
vnoremap <C-x> "+x
vnoremap <C-c> "+y
inoremap <C-v> <C-r><C-o>+

# =========================
# Simple project-root behavior
# =========================
def FindProjectRoot(start: string): string
  var dir = fnamemodify(start, ':p:h')
  while dir != '/'
    if isdirectory(dir .. '/.git')
          || filereadable(dir .. '/settings.gradle')
          || filereadable(dir .. '/settings.gradle.kts')
          || filereadable(dir .. '/build.gradle')
          || filereadable(dir .. '/build.gradle.kts')
          || filereadable(dir .. '/Cargo.toml')
      return dir
    endif
    var parent = fnamemodify(dir, ':h')
    if parent == dir
      break
    endif
    dir = parent
  endwhile
  return ''
enddef

augroup project_root
  autocmd!
  autocmd BufEnter * {
    var root = FindProjectRoot(expand('%:p'))
    if !empty(root)
      execute 'silent cd ' .. fnameescape(root)
    endif
  }
augroup END

# =========================
# LSP
# =========================
g:lsp_diagnostics_echo_cursor = 1

nnoremap <leader>ld <Cmd>LspDefinition<CR>
nnoremap <leader>lN <Cmd>LspPreviousDiagnostic<CR>
nnoremap <leader>ln <Cmd>LspNextDiagnostic<CR>
nnoremap <leader>lr <Cmd>LspReferences<CR>
nnoremap <leader>lR <Cmd>LspRename<CR>
nnoremap <leader>lt <Cmd>LspTypeHierarchy<CR>
nnoremap <leader>lh <Cmd>LspHover<CR>

# =========================
# Build / test via :make
# =========================
augroup compilers
  autocmd!
  autocmd FileType java,groovy,scala setlocal makeprg=./gradlew\ build
  autocmd FileType java,groovy,scala nnoremap <buffer> <leader>mb <Cmd>make<CR>
  autocmd FileType java,groovy,scala nnoremap <buffer> <leader>mt <Cmd>setlocal makeprg=./gradlew\ test <Bar> make <Bar> setlocal makeprg=./gradlew\ build<CR>

  autocmd FileType rust setlocal makeprg=cargo\ build
  autocmd FileType rust nnoremap <buffer> <leader>mb <Cmd>make<CR>
  autocmd FileType rust nnoremap <buffer> <leader>mt <Cmd>setlocal makeprg=cargo\ test <Bar> make <Bar> setlocal makeprg=cargo\ build<CR>
augroup END

# Quickfix helpers
nnoremap <leader>co <Cmd>copen<CR>
nnoremap <leader>cc <Cmd>cclose<CR>
nnoremap <leader>cn <Cmd>cnext<CR>
nnoremap <leader>cp <Cmd>cprevious<CR>

# =========================
# Fugitive
# =========================
nnoremap <leader>gs  <Cmd>Git<CR>
nnoremap <leader>gcc <Cmd>Git commit<CR>
nnoremap <leader>gca <Cmd>Git commit --amend<CR>
nnoremap <leader>gb  <Cmd>Git blame<CR>
nnoremap <leader>gri <Cmd>Git rebase -i<CR>
nnoremap <leader>gf  <Cmd>Git pull --rebase<CR>
nnoremap <leader>gp  <Cmd>Git push<CR>
