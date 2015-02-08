source ~/.shrc

HISTFILE=~/.zsh_history export HISTFILE;
SAVEHIST=1000;			export SAVEHIST;

bindkey -e
PS1="%{%B%}[%n@%m] %1d %#%{%b%} "
