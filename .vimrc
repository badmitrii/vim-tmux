:let mapleader = "\<Space>"

syntax on
set rnu
set number
set incsearch
set expandtab

""""""""""""
""Bindings""
""""""""""""

nnoremap <Leader>f <C-b>
nnoremap <Leader>b <C-f>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>l <C-w>l
nnoremap <Leader>k <C-w>k
vnoremap <Leader>c "+y
nnoremap <Leader>v "+p
nnoremap <Leader>V "+P
nnoremap <Leader>o :<C-U>call append(line("."), repeat([''], v:count1))<CR>
nnoremap <Leader>O :<C-U>call append(line(".")-1, repeat([''], v:count1))<CR>
"nnoremap <Space> i<Space><Right><ESC>


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
