" Add NERDTree grep menuitem with fzf.vim + ag
if exists("g:loaded_nerdtree_grep_menuitem")
    finish
endif
let g:loaded_nerdtree_grep_menuitem = 1 

call NERDTreeAddMenuItem({
            \ 'text': '(g)rep directory',
            \ 'shortcut': 'g',
            \ 'callback': 'NERDTreeGrep' })

function! NERDTreeGrep()
    let dirnode = g:NERDTreeDirNode.GetSelected()

    let pattern = input("Enter the search pattern: ")

    "use the previous window to jump to the first search result
    wincmd w

    "a hack for *nix to make sure the output of "grep" isnt echoed in vim
    let old_shellpipe = &shellpipe
    let &shellpipe='&>'

    try 
        " add for save current path
        let s:current_dir=expand("%:p:h")
        exec 'silent cd ' . dirnode.path.str()
        exec 'silent Ag ' . pattern
        "exec 'silent grep -rn ' . pattern . ' ' . dirnode.path.str() 
    finally
        let &shellpipe = old_shellpipe
        " add for return to path of before executing grep
        exec 'silent cd ' . s:current_dir
    endtry
endfunction
