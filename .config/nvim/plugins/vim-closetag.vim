" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/vim-closetag.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-23T09:42:58+0200

" these are the file extensions where this plugin is enabled
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" this will make the list of non-closing tags self-closing in the specified files
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" these are the file types where this plugin is enabled
let g:closetag_filetypes = 'html,xhtml,phtml'

" this will make the list of non-closing tags self-closing in the specified files
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" this will make the list of non-closing tags case-sensitive
" (e.g. `<Link>` will be closed while `<link>` won't)
let g:closetag_emptyTags_caseSensitive = 0

" disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" add > at current position without closing the current tag, default is '<leader>>'
let g:closetag_close_shortcut = '<leader>.'
