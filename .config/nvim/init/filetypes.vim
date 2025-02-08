" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/filetypes.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2025-02-08T07:50:26+0100

" file type specific settings
filetype on                         " enable file type detection
filetype plugin on                  " load the plugins for specific file types
filetype indent on                  " automatically indent code

" enable spell check
autocmd FileType tex,latex,markdown,gitcommit
    \ setlocal spell spelllang=en_us,de_de
