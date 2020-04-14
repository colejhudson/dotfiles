#!/usr/bin/env bash

export EDITOR='vim'
export TERM='xterm-256color'

export LANG='en_US.UTF-8'
export LC_COLLATE='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_MESSAGES='en_US.UTF-8'
export LC_MONETARY='en_US.UTF-8'
export LC_NUMERIC='en_US.UTF-8'
export LC_TIME='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export GPG_TTY=$(tty)

alias c='clear'
alias l='ls -ha'
alias ll='l -l'
alias ..='cd ..'
alias ...='cd ../..'
alias v='vim'
alias please='sudo'
alias portof='lsof -i :'