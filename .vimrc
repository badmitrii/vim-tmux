"TODO: 
"1. Make terminal window being hidden instead of closing and re-opening from scratch
"2. Make toggle terminal work even in edit mode
"3. Creating new file and other navigation-related staff are not implemented now 
:let mapleader = "\<Space>"

""""""""""""""""jedi-vim""""""""""""""""""
let g:jedi#goto_assignments_command = "<F3>"
""""""""""""""""jedi-vim""""""""""""""""""

""""""""""""""""toggle-tagbar""""""""""""""""""
let s:toggle_tagbar = "<F8>"
""""""""""""""""toggle-tagbar""""""""""""""""""

""""""""""""""""toggle-terminal""""""""""""""""""
let g:show_term = "&"
let g:toggle_term = "<C-j>"
let g:term_rows = 15

let s:term_buf_nr = -1
function! CreateTerminalInstance()
    execute "terminal ++hidden"
    return bufnr("$")
endfunction

function! ShowTerminal()
    if s:term_buf_nr == -1
        let s:term_buf_nr = CreateTerminalInstance()
    endif
    let l:term_winnrs = win_findbuf(s:term_buf_nr)
    if(len(l:term_winnrs) == 0)
        execute "bot " . g:term_rows . "split"
        execute "b " . s:term_buf_nr
    else
        let l:term_winnr = get(win_findbuf(l:term_winnrs), 0)
        call win_gotoid(l:term_winnr)
    endif
endfunction

function! ToggleTerminal()
    if s:term_buf_nr == -1
        let s:term_buf_nr = CreateTerminalInstance()
    endif
    let l:terminal_winnrs = win_findbuf(s:term_buf_nr)
    if(len(l:terminal_winnrs) != 0)
        for winnr in l:terminal_winnrs
            execute "close! " . winnr
        endfor
    else
        execute "bot " . g:term_rows . "split"
        execute "b " . s:term_buf_nr
    endif
endfunction
""""""""""""""""toggle-terminal""""""""""""""""""

""""""""""""""""project build""""""""""""""""""
function! Prj_dir_open()
    echo "Opened!"
endfunction

function! Prj_build()
    echo "Project was built!"
endfunction

function! Prj_run_all_tests()
    echo "All tests passed!"
endfunction

command! PrjOpen call Prj_dir_open()
command! PrjBuild call Prj_build()
command! PrjRunTests call Prj_run_all_tests()
""""""""""""""""project build""""""""""""""""""

""""""""""""""""nerdtree""""""""""""""""""
let s:toggle_nerd_tree = "<C-b>"

"A helper function to accept a node argument
function! NERDTreeToggleTerminalHelper(node)
    call ToggleTerminal()
endfunction

"NERDTree is not loaded yet so postopone remapping
"See: https://github.com/scrooloose/nerdtree/issues/874
au VimEnter * call NERDTreeAddKeyMap({
       \ 'key': "" . g:toggle_term,
       \ 'callback': 'ToggleTerminal',
       \ 'override': 1,
       \ 'quickhelpText': 'toggle terminal buffer'})

au VimEnter * call NERDTreeAddKeyMap({
       \ 'key': "" . g:toggle_term,
       \ 'callback': 'NERDTreeToggleTerminalHelper',
       \ 'override': 1,
       \ 'quickhelpText': 'toggle terminal buffer',
       \ 'scope': 'Node'})
""""""""""""""""nerdtree""""""""""""""""""

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

"command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
set rnu
set number
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4

""""""""""""
""Bindings""
""""""""""""
execute "nmap " . s:toggle_tagbar " :TagbarToggle<CR>"
execute "tnoremap " . s:toggle_tagbar " <C-w>:TagbarToggle<CR>"

execute "map ". s:toggle_nerd_tree ." :NERDTreeToggle<CR>"
execute "tnoremap ".s:toggle_nerd_tree ." <C-w>:NERDTreeToggle<CR>"

nnoremap <Leader>v "+p
nnoremap <Leader>V "+P
vnoremap <Leader>c "+y

execute "nnoremap ".g:toggle_term ." :call ToggleTerminal()<CR>"
execute "tnoremap ".g:toggle_term ." <C-w>:call ToggleTerminal()<CR>"

execute "nnoremap". g:show_term ." :call ShowTerminal()<CR>"
""""""""""""""""""
""Vundle plugins""
""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
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
