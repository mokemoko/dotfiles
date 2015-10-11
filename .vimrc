" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'taglist.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc.vim', {
\   'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\   },
\ }

" for Mac only
if has("macos")
  NeoBundle 'kannokanno/previm'
  NeoBundle 'tyru/open-browser.vim'
endif

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on
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

let g:vim_markdown_folding_disabled=1
let g:vimshell_interactive_update_time=1000
