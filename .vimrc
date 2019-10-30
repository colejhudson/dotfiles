set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'elixir-editors/vim-elixir'

call vundle#end()
filetype plugin indent on

syntax on
colorscheme desert

set textwidth=79
set formatoptions=qrn1

set encoding=utf-8

set autoindent
set showmatch
set smarttab

set tabstop=2
set shiftwidth=2
set expandtab

set noswapfile

set hlsearch
set incsearch

let mapleader = ","
let g:mapleader = ","

vmap <leader>w :w<cr>

imap <leader>w <esc>:w<cr>i
imap <leader>q <esc>
