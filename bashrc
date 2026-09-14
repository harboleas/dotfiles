#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nvim-godot='nvim --listen /tmp/godothost'

VERDE='\[\e[0;32m\]'
AZUL='\[\e[0;34m\]'
AMARILLO='\[\e[0;33m\]'
RESET='\[\e[0m\]'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="[${VERDE}\u@\h ${AZUL}\w${RESET}]${AMARILLO}\$(parse_git_branch)${RESET}\$ "

fastfetch
