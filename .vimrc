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
Plugin 'git://github.com/fuenor/qfixhowm'

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

" QFixHown
let QFixHowm_Key = 'g'
let howm_dir             = '~/Dropbox/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let QFixWin_EnableMode = 1
let QFixHowm_HolidayFile = '~/.vim/bundle/qfixhowm/misc/holiday/Sche-Hd-0000-00-00-000000.utf8'
set timeout timeoutlen=3000 ttimeoutlen=100
