" path:   /home/klassiker/Projects/repos/dotfiles/.config/nvim/init/plugins/vim-commentary.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-07-17T02:29:17+0200

" correct commenting for json
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType json setlocal commentstring=/\/\ %s

" correct commenting on xdefaults
autocmd FileType xdefaults setlocal commentstring=!\ %s
