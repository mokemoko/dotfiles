set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"Bundle 'YankRing.vim'
"Bundle 'vim-ruby/vim-ruby'
"Bundle 'tpope/vim-rails'
"Bundle 'scrooloose/syntastic'
Bundle 'neocomplcache'
Bundle 'taglist.vim'
Bundle 'project.tar.gz'
Bundle 'tpope/vim-surround'

filetype plugin indent on

syntax on
set term=screen-256color
set number
set hidden

set smartindent
set expandtab
set ts=2 sw=2 sts=2

set incsearch
set ignorecase
set smartcase

"neocomplcache設定
let g:neocomplcache_enable_at_startup = 1

" 日本語をキャッシュしない
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '¥h¥w*'

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" 区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 5

"set tags=~/.rvm/gems/ruby-1.9.3-p125@rails3tutorial2ndEd/rails.tags
"let g:yankring_manual_clipboard_check = 0
"let ruby_space_errors = 1
let Tlist_Use_Horiz_Window = 1

nmap <Space>b :ls<CR>:buffer
nmap <Space>f :edit .<CR>
