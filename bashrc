#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

VERDE='\[\e[0;32m\]'
AZUL='\[\e[0;34m\]'
RESET='\[\e[0m\]'


PS1="[${VERDE}\u@\h ${AZUL}\w${RESET}]\$ "

export EDITOR=nvim

fastfetch
