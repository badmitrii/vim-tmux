syntax on
set rnu
set number
set incsearch
set expandtab
nnoremap <C-f> <C-b>

""""""""""""""""""
""Bindings ""
""""""""""""""""""

nnoremap <C-b> <C-f>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
vnoremap <ESC>c "+y
nnoremap <ESC>v "+p
nnoremap <Space> i<Space><Right><ESC>
nnoremap <CR> o<ESC>k
nnoremap <Tab> i<Tab><ESC>

""""""""""""""""""
""Vundle plugins""
""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""
""Specific bindings""
"""""""""""""""""""""
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

