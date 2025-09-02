set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'lervag/vimtex'
call vundle#end()           
filetype plugin indent on 
set autoindent                                                                                                        
set linebreak
set scrolloff=1
set sidescrolloff=5
syntax enable
set laststatus=2
set ruler
set wildmenu
set cursorline
set number
set relativenumber
set title
set shiftwidth=4 smarttab

" VimTeX Configuration:
filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'
let g:vitex_compiler_method = 'latexrun'
set encoding=utf8
