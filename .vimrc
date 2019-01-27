set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'metakirby5/codi.vim'
Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plugin 'othree/html5.vim'
Plugin 'rstacruz/sparkup'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'thinca/vim-quickrun'
Plugin 'lervag/vimtex'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'ujihisa/repl.vim'
Plugin 'roman/golden-ratio'
Plugin 'shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'l04m33/vlime', {'rtp': 'vim/'}
Plugin 'rizzatti/dash.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jez/vim-better-sml'
Plugin 'keith/swift.vim'
Plugin 'jvoorhis/coq.vim'
Plugin 'the-lambda-church/coquille'
Plugin 'let-def/vimbufsync' "Coquille dependency
Plugin 'nightsense/snow' 
Plugin 'jdsimcoe/abstract.vim'
Plugin 'reasonml-editor/vim-reason-plus'
Plugin 'ElmCast/elm-vim'
Plugin 'junegunn/vader.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'qqwaszxxx/vim-battlestation'
Plugin 'dag/vim-fish'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent off    " required

set showcmd
set tabstop=2
set expandtab
set shiftwidth=2
set timeoutlen=1000 ttimeoutlen=70

let mapleader = "\<C-V>"
     
nmap <leader>zi <leader>zz<bar>i
nmap <space> i<space><Esc>
nmap <space><Right> i<Right><space><Esc>
nmap <leader>wi :w<CR>i
nmap <leader>wq :w<CR>:q<CR>
nmap <leader>q :q<CR>
nmap <leader>so :source %<CR>
nmap <leader>d :Dash<CR>
nmap <C-o> i<Enter><Esc>k$l
nmap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

vmap <leader>i <ESC><bar>i
imap <leader>q <ESC> 
imap <leader>v <ESC><bar>v
imap <leader>wq <leader>q<bar>wq
imap <leader>w <leader>q<bar>wi
imap <leader>c <leader>q<bar>zi
imap <leader>d <ESC>:Dash<CR>i
imap <leader>e <End>
imap <leader>b <Home>
imap <leader>s <leader>q<bar><C-w>w<bar>i
imap <leader>o <leader>q<bar>

tmap <leader>q <ESC>

set number relativenumber
set nu rnu
augroup number numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

augroup rb
  autocmd!
  autocmd FileType ruby set softtabstop = 2
  autocmd FileType ruby set sw = 2
  autocmd FileType ruby set ts = 2
augroup END

augroup js
  autocmd!
  autocmd FileType *.js let javascript_plugin_jsdoc = 1
  autocmd FileType *.js let javascript_plugin_flow = 1
augroup END

augroup jsx
  autocmd!
augroup END

augroup make
  autocmd!
  autocmd FileType make set noexpandtab
augroup END

augroup c
augroup END

augroup chz
  autocmd BufNewFile,BufRead chz set syntax = scheme
augroup END

augroup hs
  autocmd!
  autocmd FileType haskell let haskell_indent_guard = 2
  autocmd FileType haskell let haskell_indent_case = 2
  autocmd FileType haskell let haskell_indent_do = 3 
  autocmd FileType haskell set softtabstop = 2
  autocmd FileType haskell set sw = 2
  autocmd FileType haskell set ts = 2
augroup END

augroup sml
  autocmd! 
  autocmd FileType sml let sml_greek_tyvar_show_tick = 1
	autocmd FileType sml nnoremap <leader>t :SMLTypeQuery<CR>
	autocmd FileType sml nnoremap gd :SMLJumpToDef<CR>
augroup END

augroup coq
  autocmd!
  autocmd FileType coq call coquille#FNMapping()
augroup END
