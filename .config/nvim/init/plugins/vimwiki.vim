" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/vimwiki.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-07-11T12:02:08+0200

let notes={
    \ 'path': '$HOME/Documents/Notes',
    \ 'path_html': '$HOME/Documents/Notes/html/',
    \ 'syntax': 'markdown',
    \ 'ext': '.md',
    \ 'auto_export': 1,
    \ 'automatic_nested_syntaxes': 1,
    \ 'template_path': '$HOME/.local/share/repos/vimwiki-pandoc/template/',
    \ 'template_default': 'github',
    \ 'template_ext': '.html5',
    \ 'custom_wiki2html': '$HOME/.local/share/repos/vimwiki-pandoc/wiki2html.sh'
\ }

let g:vimwiki_list=[notes]
let g:vimwiki_global_ext=0
let g:vimwiki_use_mouse=1
