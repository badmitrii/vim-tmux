:let mapleader = "\<Space>"

""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""jedi-vim""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""

let g:jedi#goto_assignments_command = "<F3>"

""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""jedi-vim""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""

""""""toggle paste ident when paste"""""""
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
""""""toggle paste ident when paste"""""""

nmap <F8> :TagbarToggle<CR>

syntax on

command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
set rnu
set number
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4

""""""""""""
""Bindings""
""""""""""""

nnoremap <Leader>f <C-b>
nnoremap <Leader>s r<ENTER>k$
nnoremap <Leader>b <C-f>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>l <C-w>l
nnoremap <Leader>k <C-w>k
nnoremap <Leader>v "+p
nnoremap <Leader>V "+P
nnoremap <Leader>o :<C-U>call append(line("."), repeat([''], v:count1))<CR>
nnoremap <Leader>O :<C-U>call append(line(".")-1, repeat([''], v:count1))<CR>

xnoremap p pgvy

vnoremap <Leader>c "+y

"nnoremap <Space> i<Space><Right><ESC>

""""""""""""""""""
""Vundle plugins""
""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
Plugin 'wincent/command-t'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""
""Specific bindings""
"""""""""""""""""""""
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
