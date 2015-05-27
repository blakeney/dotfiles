#!/bin/sh
# Set up Vim

# Swap Directory
mkdir -p ~/.vim/swapfiles

# VIMRC File
curl -LSso ~/.vimrc https://raw.githubusercontent.com/blakeney/dotfiles/master/.vimrc

# Pathogen (VIM package manager)
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Plugins
dir = `pwd`
cd ~/.vim/bundle
git clone https://github.com/maxbrunsfeld/vim-emacs-bindings
git clone https://github.com/moll/vim-bbye
git clone https://github.com/tpope/vim-dispatch
git clone https://github.com/vifm/vifm.vim
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/airblade/vim-rooter
git clone https://github.com/JalaiAmitahl/maven-compiler.vim
git clone https://github.com/fholgado/minibufexpl.vim
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/derekwyatt/vim-scala
git clone https://github.com/cespare/vjde
git clone https://github.com/jceb/vim-orgmode
git clone https://github.com/tpope/vim-speeddating
cd $dir
