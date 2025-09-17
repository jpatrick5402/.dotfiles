[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1="┌─[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\w\[\e[0m\]]\n└─> "
