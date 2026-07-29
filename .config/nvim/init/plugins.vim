" path:   /home/klassiker/Projects/repos/dotfiles/.config/nvim/init/plugins.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-07-29T03:19:22+0200

let g:plugged_dir='~/.local/share/nvim/plugged/'
let g:plugged_config_dir='~/.config/nvim/init/plugins/'

" vim-plug autoinstall
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin(g:plugged_dir)
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'brenoprata10/nvim-highlight-colors'
    Plug 'liuchengxu/vim-which-key'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fidian/hexmode'
    Plug 'vimwiki/vimwiki'
call plug#end()

" if plugin directory exists source config file
function! SourcePlugin(type, name)
    let l:plugin=g:plugged_dir.a:name
    let l:config_name=split(a:name, '\.')
    let l:config=g:plugged_config_dir.l:config_name[0]
    if a:type=='lua'
        let l:config=l:config.'.lua'
    else
        let l:config=l:config.'.vim'
    endif
    if !empty(glob(l:plugin))
        if !empty(glob(l:config))
            execute 'source' l:config
        else
            echo l:config." not found\n"
        endif
    else
        echo l:plugin." not found\n"
    endif
endfunction

for [type, name] in [
            \ ['vim', 'lightline.vim'],
            \ ['vim', 'goyo.vim'],
            \ ['lua', 'nvim-highlight-colors'],
            \ ['vim', 'vim-which-key'],
            \ ['vim', 'indentLine'],
            \ ['vim', 'vim-commentary'],
            \ ['vim', 'vim-gitgutter'],
            \ ['vim', 'coc.nvim'],
            \ ['vim', 'hexmode'],
            \ ['vim', 'vimwiki']
        \ ]
    call SourcePlugin(type, name)
endfor
