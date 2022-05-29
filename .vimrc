" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

" Keymaps
nnoremap <C-n> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_show_hidden=1

" Show line numbers
set number

" vimrc
source ./vim/basic.vim