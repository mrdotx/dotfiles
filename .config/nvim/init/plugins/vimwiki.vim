" path:   /home/klassiker/Projects/repos/dotfiles/.config/nvim/init/plugins/vimwiki.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-07-17T02:29:27+0200

let notes={
    \ 'path': '$HOME/Documents/Notes',
    \ 'path_html': '$HOME/Documents/Notes/html/',
    \ 'syntax': 'markdown',
    \ 'ext': '.md',
    \ 'auto_export': 1,
    \ 'automatic_nested_syntaxes': 1,
    \ 'template_path': '$HOME/Projects/repos/vimwiki-pandoc/template/',
    \ 'template_default': 'github',
    \ 'template_ext': '.html5',
    \ 'custom_wiki2html': '$HOME/Projects/repos/vimwiki-pandoc/wiki2html.sh'
\ }

let g:vimwiki_list=[notes]
let g:vimwiki_global_ext=0
let g:vimwiki_use_mouse=1
