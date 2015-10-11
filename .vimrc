"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/astana/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/astana/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'taglist.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


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
set hlsearch

set ambiwidth=double

set fileencodings=utf-8,cp932,euc-jp,default,latin,ucs-bom,iso-2022-jp

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

" ext
command! ParseXML %s/></>\r</g | filetype indent on | setf xml | normal gg=G

" md
let g:vim_markdown_folding_disabled=1
