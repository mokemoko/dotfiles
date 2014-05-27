set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"Plugin 'YankRing.vim'
Plugin 'taglist.vim'
Plugin 'scrooloose/syntastic'
Plugin 'project.tar.gz'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc'
Plugin 'hotchpotch/perldoc-vim'

call vundle#end()
filetype plugin indent on

syntax on
"set term=screen-256color
set number
set hidden

set smartindent
set expandtab
set ts=2 sw=2 sts=2

set incsearch
set ignorecase
set smartcase

set ambiwidth=double

let Tlist_Use_Horiz_Window = 1

" JQ
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq " . l:arg
endfunction
