" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

" Keymaps
nnoremap <C-n> :NERDTreeToggle<CR>

" vimrc
source ./vim/basic.vim