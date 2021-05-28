" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/vimwiki.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-28T11:53:37+0200

let notes={}
let notes.path='$HOME/Dokumente/Notes'
let notes.path_html='$HOME/Dokumente/Notes/html/'
let notes.syntax='markdown'
let notes.ext='.md'
let notes.auto_export=1
let notes.automatic_nested_syntaxes=1
let notes.template_path='$HOME/.local/share/repos/vimwiki-pandoc/template/'
let notes.template_default='github'
let notes.template_ext='.html5'
let notes.custom_wiki2html='$HOME/.local/share/repos/vimwiki-pandoc/wiki2html.sh'
let g:vimwiki_list=[notes]
let g:vimwiki_global_ext=0
let g:vimwiki_use_mouse=1
