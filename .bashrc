#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'

PS1='[\e[0;32m\u@\h\e[m: \e[0;34m\w\e[m]\e[0;32m\$\e[m '

fastfetch

