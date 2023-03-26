" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/templates.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2023-03-26T10:25:15+0200

let g:template_folder='~/.config/nvim/init/templates/'

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
