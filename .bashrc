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

if [[ -e $HOME/.rvm ]]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  export PATH="$PATH:$HOME/.rvm/bin"
fi

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.local/bin

export GOROOT=/usr/local/go

export GPG_TTY=$(tty)

alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias l='ls -ha'
alias ll='l -l'
alias v='vim'
alias please='sudo'
alias crispr='vi ~/.bashrc && source ~/.bashrc'
