:let mapleader = "\<Space>"

""""""""""""""""jedi-vim""""""""""""""""""
let g:jedi#goto_assignments_command = "<F3>"
""""""""""""""""jedi-vim""""""""""""""""""


""""""""""""""""toggle-terminal""""""""""""""""""
let g:toggle_term = "<C-j>"
let g:term_rows = 15
let s:term_buf_nr = -1
function! ToggleTerminal()
    if s:term_buf_nr == -1
        execute "bot term ++rows=" . g:term_rows
        let s:term_buf_nr = bufnr("$")
    else
        execute "bd! " .s:term_buf_nr
        let s:term_buf_nr = -1
    endif
endfunction
""""""""""""""""toggle-terminal""""""""""""""""""

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
nmap <F8> :TagbarToggle<CR>

nnoremap <Leader>v "+p
nnoremap <Leader>V "+P
vnoremap <Leader>c "+y

execute "nnoremap ".g:toggle_term ." :call ToggleTerminal()<CR>"
execute "tnoremap ".g:toggle_term ." <C-w>N:call ToggleTerminal()<CR>"
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
