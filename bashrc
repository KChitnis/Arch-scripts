#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias plz='sudo'
alias please='sudo'
alias H='sudo bash ~/Scripts/hotspot.sh'
alias jio='sudo bash ~/Scripts/jio.sh'
PS1='[\[\e[31m\]\u\[\e[37m\]@\[\e[32m\]\h:\[\e[33m\]\w\[\e[37m\]]\$ '
