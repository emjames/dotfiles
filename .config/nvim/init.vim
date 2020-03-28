" Emjames init.vim file
"

set nocompatible 	" disable compatibility with vi
filetype off            " required for bundler 
"vim-plug
"set rtp+=~/.config/
call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.vim', {'branch': 'release'}


" All plugins must be added before the following line
call plug#end()
"
filetype plugin indent on " required

" vimrc
set showmatch 		" show matching brackets
set ignorecase
set mouse=v		" middle click mouse is paste
set hlsearch
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set relativenumber
set wildmode=longest,list
set cc=80		" set an 80 col limit 
syntax on
colorscheme codedark
