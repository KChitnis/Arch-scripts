#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias plz='sudo'
alias please='sudo'
PS1='[\[\e[31m\]\u\[\e[37m\]@\[\e[32m\]\h:\[\e[33m\]\w\[\e[37m\]]\$ '
