" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/templates.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2024-06-15T12:04:06+0200

let g:template_folder='~/.config/nvim/init/templates/'

" use template for specific file types when creating new file
function! NewTemplate(file)
    let l:file_type=split(a:file, '\.')
    let l:config=g:template_folder.a:file
    let l:template='autocmd BufNewFile *.'.l:file_type[0]
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
        call NewTemplate('c.tpl')
        call NewTemplate('lua.tpl')
        call NewTemplate('gpg.tpl')
        call NewTemplate('md.tpl')
        call NewTemplate('py.tpl')
        call NewTemplate('sh.tpl')
        call NewTemplate('vim.tpl')
    augroup END
endif
