" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/vim-commentary.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2025-02-08T07:50:15+0100

" correct commenting for json
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType json setlocal commentstring=/\/\ %s

" correct commenting on xdefaults
autocmd FileType xdefaults setlocal commentstring=!\ %s
