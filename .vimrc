" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'catppuccin/vim'

call vundle#end()
filetype plugin indent on

" Colors
set termguicolors
syntax enable

" Text
set smarttab

" Theme
colorscheme catppuccin_mocha
let g:airline_theme = 'catppuccin_mocha'

" Keymaps
nnoremap <C-n> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_show_hidden=1

" Show line numbers
set number
set fillchars=eob:\ 
