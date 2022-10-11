if &compatible
  set nocompatible               " Be iMproved
endif

set encoding=UTF8

" line numbering
set nu
set rnu

" syntax highlight
syntax enable
syntax on
set showmatch

" colorscheme
colo elflord

" search options
set ignorecase
set smartcase
set incsearch
set hlsearch

" key mappings
let mapleader = ","

nnoremap <leader>c :nohl<CR>
