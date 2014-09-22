# CSH/TCSH Configuration, Copied and Modified from PC-BSD 10.0 Default
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

# General Aliases
alias h		history 100 
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA
alias ls	ls -G

# Use Exuberent CTags for gVim compatibility
alias ctags exctags -f .tags

# Git Aliases
alias Gs 'git status'
alias Gl 'git log'
alias Gd 'git pull'
alias Gu 'git push'
alias Ga 'git add'
alias Gc 'git commit'
alias Gca 'git commit -a'
alias Go 'git checkout'
alias Gb 'git branch'
alias Gr 'git remote'

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	CLICOLOR true
setenv	EDITOR	vim
setenv	PAGER	less
setenv	BLOCKSIZE	K

if ($?prompt) then
	# An interactive shell -- set some stuff up
	switch ($TERM)
    	case "xterm*":
		set prompt = '%{\033]0;%n@%m:%~\007%}[%B%n@%m%b] %B%~%b%# '
       		breaksw
    	default:
		set prompt = '[%B%n@%m%b] %B%~%b%# '
       		breaksw
	endsw
	set autolist = ambiguous
	set complete = enhance
	set correct = cmd
	set filec
    #set autocorrect
	set filec
	set history = 100
	set savehist = 100
	# Use history to aid expansion
        set autoexpand
        set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif

# Enable colors and such for git diffs
setenv MORE "-erX"
