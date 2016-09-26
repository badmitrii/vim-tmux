syntax on
set rnu
set number
set incsearch
nnoremap <C-f> <C-b>
nnoremap <C-b> <C-f>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
vnoremap <ESC>c "+y
vnoremap <ESC>v "+p

"""""""""""""""""""
"""Vundle plugins""
"""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
call vundle#end()            " required
filetype plugin indent on    " required
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

