" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/coding.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-06-28T12:06:04+0200

let g:template_folder='~/.config/nvim/init/templates/'

let python_highlight_all=1          " enable all python syntax highlightings
set foldmethod=indent               " enable folding
set foldlevel=99
set encoding=utf-8                  " file encoding
" disables automatic commenting on newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" mark extra white space
autocmd BufNewFile,BufRead * match ExtraWhitespace /\s\+$/

" style guide
set tabstop=4                       " number of visual spaces per TAB
set softtabstop=4                   " number of spaces in tab when editing
set shiftwidth=4                    " the size of an indent
set expandtab                       " tabs are spaces
set autoindent                      " indent when moving to the next line
set colorcolumn=80                  " show width indicator

" python pep 8 style guide
function! AutoPy()
    set textwidth=79
    set fileformat=unix
endfunction
autocmd BufNewFile,BufRead *.py call AutoPy()

" get correct comment highlighting for json
autocmd FileType json syntax match Comment +\/\/.\+$+

" use template for specific file types when creating new file
function! NewTemplate(file)
    let l:file_type=split(a:file, '\.')
    let l:config=g:template_folder.a:file
    let l:template='autocmd BufNewFile *.'.l:file_type[1]
        \ .' 0r '
        \ .l:config
        \ .' | startinsert'
        \ .' | inoremap <space><space> <esc>/<++><enter>"_c4l'
    if !empty(glob(l:config))
        execute l:template
    else
        echo l:config." not found\n"
    endif
endfunction

if has("autocmd")
    augroup templates
        call NewTemplate('skeleton.c')
        call NewTemplate('skeleton.lua')
        call NewTemplate('skeleton.md')
        call NewTemplate('skeleton.py')
        call NewTemplate('skeleton.sh')
        call NewTemplate('skeleton.vim')
    augroup END
endif
