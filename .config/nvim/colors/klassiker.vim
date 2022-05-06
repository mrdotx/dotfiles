" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/colors/klassiker.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2022-05-06T13:17:20+0200

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="klassiker"

" colors used in this scheme
" GUI: #000000, Term: 0     " GUI: #333333, Term: 8
" GUI: #df2800, Term: 1     " GUI: #ff5555, Term: 9
" GUI: #00b200, Term: 2     " GUI: #39ff14, Term: 10
" GUI: #b0b200, Term: 3
" GUI: #1f5393, Term: 4     " GUI: #4185d7, Term: 12
" GUI: #980096, Term: 5
" GUI: #008081, Term: 6
                            " GUI: #ffffff, Term: 15

" GUI: #223344, Term: 23    " GUI: #2b2b2b, Term: 234
" GUI: #334455, Term: 59    " GUI: #666666, Term: 242
" GUI: #778899, Term: 103
" GUI: #f92782, Term: 197

" popup Menu
    hi Pmenu            guifg=#ffffff guibg=#223344 gui=NONE
    hi PmenuSet         guifg=#008081 guibg=#000000 gui=NONE
    hi PmenuSBar        guifg=#008081 guibg=#334455 gui=NONE
    hi PmenuSel         guifg=#008081 guibg=#334455 gui=NONE
    hi PmenuThumb       guifg=#778899 guibg=#778899 gui=NONE
if &t_Co > 255
    hi Pmenu            ctermfg=15    ctermbg=23    cterm=NONE
    hi PmenuSet         ctermfg=6     ctermbg=0     cterm=NONE
    hi PmenuSBar        ctermfg=6     ctermbg=59    cterm=NONE
    hi PmenuSel         ctermfg=6     ctermbg=59    cterm=NONE
    hi PmenuThumb       ctermfg=103   ctermbg=103   cterm=NONE
endif

" editor
    hi Normal           guifg=#ffffff guibg=#000000 gui=NONE
    hi Conceal          guifg=#008081 guibg=#000000 gui=NONE
    hi NonText          guifg=#334455 guibg=NONE    gui=NONE
    hi StatusLine       guifg=#008081 guibg=#000000 gui=NONE
    hi StatusLineNC     guifg=#778899 guibg=#000000 gui=NONE
    hi WildMenu         guifg=#000000 guibg=#b0b200 gui=NONE
    hi Search           guifg=#ffffff guibg=#1f5393 gui=NONE
    hi VertSplit        guifg=#4185d7 guibg=NONE    gui=NONE
    hi LineNr           guifg=#778899 guibg=NONE    gui=NONE
    hi SignColumn       guifg=NONE    guibg=NONE    gui=NONE
if &t_Co > 255
    hi Normal           ctermfg=15    ctermbg=0     cterm=NONE
    hi Conceal          ctermfg=6     ctermbg=0     cterm=NONE
    hi NonText          ctermfg=59    ctermbg=NONE  cterm=NONE
    hi StatusLine       ctermfg=6     ctermbg=0     cterm=NONE
    hi StatusLineNC     ctermfg=103   ctermbg=0     cterm=NONE
    hi WildMenu         ctermfg=0     ctermbg=3     cterm=NONE
    hi Search           ctermfg=15    ctermbg=12    cterm=NONE
    hi VertSplit        ctermfg=12    ctermbg=NONE  cterm=NONE
    hi LineNr           ctermfg=103   ctermbg=NONE  cterm=NONE
    hi SignColumn       ctermfg=NONE  ctermbg=NONE  cterm=NONE
endif

" messages
    hi Question         guifg=#b0b200 guibg=NONE    gui=NONE
    hi ModeMsg          guifg=#b0b200 guibg=NONE    gui=NONE
    hi MoreMsg          guifg=#b0b200 guibg=NONE    gui=NONE
    hi ErrorMsg         guifg=#000000 guibg=#df2800 gui=NONE
    hi WarningMsg       guifg=#df2800 guibg=NONE    gui=NONE
if &t_Co > 255
    hi Question         ctermfg=3     ctermbg=NONE  cterm=NONE
    hi ModeMsg          ctermfg=3     ctermbg=NONE  cterm=NONE
    hi MoreMsg          ctermfg=3     ctermbg=NONE  cterm=NONE
    hi ErrorMsg         ctermfg=0     ctermbg=1     cterm=NONE
    hi WarningMsg       ctermfg=1     ctermbg=NONE  cterm=NONE
endif

" spelling
    hi SpellBad         guifg=#ffffff guibg=NONE    gui=undercurl guisp=#ffffff
    hi SpellCap         guifg=#666666 guibg=NONE    gui=undercurl guisp=#666666
    hi SpellLocal       guifg=#008081 guibg=NONE    gui=undercurl guisp=#008081
    hi SpellRare        guifg=#ff5555 guibg=NONE    gui=undercurl guisp=#ff5555
if &t_Co > 255
    hi SpellBad         ctermfg=15    ctermbg=NONE  cterm=undercurl
    hi SpellCap         ctermfg=242   ctermbg=NONE  cterm=undercurl
    hi SpellLocal       ctermfg=6     ctermbg=NONE  cterm=undercurl
    hi SpellRare        ctermfg=9     ctermbg=NONE  cterm=undercurl
endif

" tabline
    hi TabLine          guifg=#666666 guibg=#000000 gui=NONE
    hi TabLineSel       guifg=#ffffff guibg=#334455 gui=NONE
    hi TabLineFill      guifg=#000000 guibg=#000000 gui=NONE
if &t_Co > 255
    hi TabLine          ctermfg=242   ctermbg=0     cterm=NONE
    hi TabLineSel       ctermfg=15    ctermbg=59    cterm=NONE
    hi TabLineFill      ctermfg=0     ctermbg=0     cterm=NONE
endif

" misc
    hi SpecialKey       guifg=#334455 guibg=NONE    gui=NONE
    hi Title            guifg=#b0b200 guibg=NONE    gui=NONE
    hi Directory        guifg=#008081 guibg=NONE    gui=NONE
if &t_Co > 255
    hi SpecialKey       ctermfg=59    ctermbg=NONE  cterm=NONE
    hi Title            ctermfg=3     ctermbg=NONE  cterm=NONE
    hi Directory        ctermfg=6     ctermbg=NONE  cterm=NONE
endif

" diff
    hi DiffAdd          guifg=#2b2b2b guibg=#39ff14 gui=NONE
    hi DiffDelete       guifg=#2b2b2b guibg=#ff5555 gui=NONE
    hi DiffChange       guifg=#2b2b2b guibg=#ff5555 gui=NONE
    hi DiffText         guifg=#ffffff guibg=NONE    gui=NONE
if &t_Co > 255
    hi DiffAdd          ctermfg=234   ctermbg=10    cterm=NONE
    hi DiffDelete       ctermfg=234   ctermbg=9     cterm=NONE
    hi DiffChange       ctermfg=234   ctermbg=9     cterm=NONE
    hi DiffText         ctermfg=15    ctermbg=NONE  cterm=NONE
endif

" folding
    hi Folded           guifg=#778899 guibg=#2b2b2b gui=NONE
    hi FoldColumn       guifg=NONE    guibg=#2b2b2b gui=NONE
if &t_Co > 255
    hi Folded           ctermfg=103   ctermbg=234   cterm=NONE
    hi FoldColumn       ctermfg=NONE  ctermbg=234   cterm=NONE
endif

" cursor colors
    hi ColorColumn      guifg=NONE    guibg=#223344 gui=NONE
    hi CursorColumn     guifg=NONE    guibg=#223344 gui=NONE
    hi CursorLine       guifg=NONE    guibg=#223344 gui=NONE
    hi Cursor           guifg=#000000 guibg=#ffffff gui=NONE
    hi Visual           guifg=NONE    guibg=#333333 gui=NONE
    hi MatchParen       guifg=#000000 guibg=#b0b200 gui=NONE
    hi TermCursor       guifg=#000000 guibg=#4185d7 gui=NONE
    hi TermCursorNC     guifg=#000000 guibg=#778899 gui=NONE
if &t_Co > 255
    hi ColorColumn      ctermfg=NONE  ctermbg=23    cterm=NONE
    hi CursorColumn     ctermfg=NONE  ctermbg=23    cterm=NONE
    hi CursorLine       ctermfg=NONE  ctermbg=23    cterm=NONE
    hi Cursor           ctermfg=0     ctermbg=15    cterm=NONE
    hi Visual           ctermfg=NONE  ctermbg=8     cterm=NONE
    hi MatchParen       ctermfg=0     ctermbg=3     cterm=NONE
    hi TermCursor       ctermfg=0     ctermbg=12    cterm=NONE
    hi TermCursorNC     ctermfg=0     ctermbg=103   cterm=NONE
endif

" general highlighting
    hi Constant         guifg=#980096 guibg=NONE    gui=NONE
    hi Number           guifg=#980096 guibg=NONE    gui=NONE
    hi Float            guifg=#980096 guibg=NONE    gui=NONE
    hi Boolean          guifg=#980096 guibg=NONE    gui=NONE
    hi Character        guifg=#b0b200 guibg=NONE    gui=NONE
    hi String           guifg=#b0b200 guibg=NONE    gui=NONE
    hi Type             guifg=#008081 guibg=NONE    gui=NONE
    hi Structure        guifg=#f92782 guibg=NONE    gui=NONE
    hi StorageClass     guifg=#f92782 guibg=NONE    gui=NONE
    hi TypeDef          guifg=#f92782 guibg=NONE    gui=NONE
    hi Identifier       guifg=#00b200 guibg=NONE    gui=NONE
    hi Function         guifg=#00b200 guibg=NONE    gui=NONE
    hi Statement        guifg=#f92782 guibg=NONE    gui=NONE
    hi Operator         guifg=#f92782 guibg=NONE    gui=NONE
    hi Label            guifg=#f92782 guibg=NONE    gui=NONE
    hi Keyword          guifg=#008081 guibg=NONE    gui=NONE
    hi Preproc          guifg=#00b200 guibg=NONE    gui=NONE
    hi Include          guifg=#008081 guibg=NONE    gui=NONE
    hi Define           guifg=#008081 guibg=NONE    gui=NONE
    hi Macro            guifg=#00b200 guibg=NONE    gui=NONE
    hi PreCondit        guifg=#00b200 guibg=NONE    gui=NONE
    hi Special          guifg=#008081 guibg=NONE    gui=NONE
    hi SpecialChar      guifg=#f92782 guibg=NONE    gui=NONE
    hi Delimiter        guifg=#f92782 guibg=NONE    gui=NONE
    hi Comment          guifg=#4185d7 guibg=NONE    gui=italic
    hi SpecialComment   guifg=#008081 guibg=NONE    gui=NONE
    hi Tag              guifg=#f92782 guibg=NONE    gui=NONE
    hi Underlined       guifg=#00b200 guibg=NONE    gui=NONE
    hi Ignore           guifg=NONE    guibg=NONE    gui=NONE
    hi Todo             guifg=#ffffff guibg=NONE    gui=bold
    hi Error            guifg=#df2800 guibg=NONE    gui=NONE
    hi ExtraWhitespace  guifg=#2b2b2b guibg=#df2800 gui=NONE
if &t_Co > 255
    hi Constant         ctermfg=5     ctermbg=NONE  cterm=NONE
    hi Number           ctermfg=5     ctermbg=NONE  cterm=NONE
    hi Float            ctermfg=5     ctermbg=NONE  cterm=NONE
    hi Boolean          ctermfg=5     ctermbg=NONE  cterm=NONE
    hi Character        ctermfg=3     ctermbg=NONE  cterm=NONE
    hi String           ctermfg=3     ctermbg=NONE  cterm=NONE
    hi Type             ctermfg=6     ctermbg=NONE  cterm=NONE
    hi Structure        ctermfg=197   ctermbg=NONE  cterm=NONE
    hi StorageClass     ctermfg=197   ctermbg=NONE  cterm=NONE
    hi TypeDef          ctermfg=197   ctermbg=NONE  cterm=NONE
    hi Identifier       ctermfg=2     ctermbg=NONE  cterm=NONE
    hi Function         ctermfg=2     ctermbg=NONE  cterm=NONE
    hi Statement        ctermfg=197   ctermbg=NONE  cterm=NONE
    hi Operator         ctermfg=197   ctermbg=NONE  cterm=NONE
    hi Label            ctermfg=197   ctermbg=NONE  cterm=NONE
    hi Keyword          ctermfg=6     ctermbg=NONE  cterm=NONE
    hi Preproc          ctermfg=2     ctermbg=NONE  cterm=NONE
    hi Include          ctermfg=6     ctermbg=NONE  cterm=NONE
    hi Define           ctermfg=6     ctermbg=NONE  cterm=NONE
    hi Macro            ctermfg=2     ctermbg=NONE  cterm=NONE
    hi PreCondit        ctermfg=2     ctermbg=NONE  cterm=NONE
    hi Special          ctermfg=6     ctermbg=NONE  cterm=NONE
    hi SpecialChar      ctermfg=197   ctermbg=NONE  cterm=NONE
    hi Delimiter        ctermfg=197   ctermbg=NONE  cterm=NONE
    hi Comment          ctermfg=12    ctermbg=NONE  cterm=italic
    hi SpecialComment   ctermfg=6     ctermbg=NONE  cterm=NONE
    hi Tag              ctermfg=197   ctermbg=NONE  cterm=NONE
    hi Underlined       ctermfg=2     ctermbg=NONE  cterm=NONE
    hi Ignore           ctermfg=NONE  ctermbg=NONE  cterm=NONE
    hi Todo             ctermfg=15    ctermbg=NONE  cterm=bold
    hi Error            ctermfg=1     ctermbg=NONE  cterm=NONE
    hi ExtraWhitespace  ctermfg=234   ctermbg=1     cterm=NONE
endif
