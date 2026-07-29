" path:   /home/klassiker/Projects/repos/dotfiles/.config/nvim/init/templates.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-07-29T03:19:31+0200

let g:template_dir='~/.config/nvim/init/templates/'

" use template for specific file types when creating new file
function! SelectTemplate(file)
    let l:file_type=split(a:file, '\.')
    let l:config=g:template_dir.a:file
    let l:template='autocmd BufNewFile *.'.l:file_type[0].' 0r '.l:config
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
        for file in [
                    \ 'c.tpl',
                    \ 'lua.tpl',
                    \ 'gpg.tpl',
                    \ 'md.tpl',
                    \ 'py.tpl',
                    \ 'sh.tpl',
                    \ 'vim.tpl'
                \ ]
            call SelectTemplate(file)
        endfor
    augroup END
endif
