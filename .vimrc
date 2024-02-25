" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'machakann/vim-sandwich'
Plugin 'vim-airline/vim-airline'
Plugin 'catppuccin/vim'

call vundle#end()
filetype plugin indent on

" Behaviors
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set mouse=a
set number relativenumber
set fillchars=eob:\ 

" Colors
set termguicolors
syntax enable

" Text
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai
set si
set wrap

" Theme
colorscheme catppuccin_mocha
let g:airline_theme = 'catppuccin_mocha'

" Keymaps
nnoremap <C-n> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_show_hidden=1

