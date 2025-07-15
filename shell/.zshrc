# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -A'
alias grep='grep --color=auto'
PS1="%n %~%# "

fastfetch
