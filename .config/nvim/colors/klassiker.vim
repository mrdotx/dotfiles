" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/colors/klassiker.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-28T15:10:08+0200

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="klassiker"

" colors used in this scheme
" GUI: #4185d7, Term:  67
" GUI: #008081, Term:  81
" GUI: #334455, Term:  59
" GUI: #111111, Term: 233
" GUI: #000000, Term:  00
" GUI: #211f1c, Term:  00
" GUI: #df2800, Term:  88
" GUI: #420e09, Term:  52
" GUI: #f92782, Term: 197
" GUI: #75715e, Term:  95
" GUI: #49483e, Term:  59
" GUI: #8f908a, Term: 102
" GUI: #00b200, Term: 112
" GUI: #980096, Term: 141
" GUI: #778899, Term: 103
" GUI: #223344, Term:  23
" GUI: #253b22, Term:  22
" GUI: #383a3e, Term: 236
" GUI: #f8f8f8, Term:  15
" GUI: #b0b200, Term: 185

" popup Menu
hi Pmenu guifg=#f8f8f8 guibg=#223344 gui=NONE ctermfg=15 ctermbg=23 cterm=NONE
hi PmenuSet guifg=#008081 guibg=#111111 gui=NONE ctermfg=81 ctermbg=233 cterm=NONE
hi PmenuSBar guifg=#008081 guibg=#334455 gui=NONE ctermfg=81 ctermbg=59 cterm=NONE
hi PmenuSel guifg=#008081 guibg=#334455 gui=NONE ctermfg=81 ctermbg=59 cterm=NONE
hi PmenuThumb guifg=#778899 guibg=#778899 gui=NONE ctermfg=103 ctermbg=103 cterm=NONE

" editor
hi Normal guifg=#f8f8f8 guibg=#111111 gui=NONE ctermfg=15 ctermbg=233 cterm=NONE
hi Conceal guifg=#008081 guibg=#111111 gui=NONE ctermfg=81 ctermbg=233 cterm=NONE
hi NonText guifg=#49483e guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#008081 guibg=#111111 gui=NONE ctermfg=81 ctermbg=233 cterm=NONE
hi StatusLineNC guifg=#778899 guibg=#111111 gui=NONE ctermfg=103 ctermbg=233 cterm=NONE
hi Search guifg=#000000 guibg=#b0b200 gui=NONE ctermfg=00 ctermbg=221 cterm=NONE
hi VertSplit guifg=#75715e guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
hi LineNr guifg=#8f908a guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
hi SignColumn guifg=NONE guibg=#211f1c gui=NONE ctermfg=NONE ctermbg=00 cterm=NONE

" messages
hi Question guifg=#b0b200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi ModeMsg guifg=#b0b200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi MoreMsg guifg=#b0b200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi ErrorMsg guifg=#111111 guibg=#f92782 gui=NONE ctermfg=233 ctermbg=197 cterm=NONE
hi WarningMsg guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE

" spelling
hi SpellBad guifg=#f8f8f8 guibg=NONE gui=undercurl ctermfg=15 ctermbg=NONE cterm=undercurl guisp=#f92782
hi SpellLocal guifg=#008081 guibg=NONE gui=undercurl ctermfg=81 ctermbg=NONE cterm=undercurl guisp=#008081

" tabline
hi TabLine guifg=#8f908a guibg=#111111 gui=NONE ctermfg=102 ctermbg=233 cterm=NONE
hi TabLineSel guifg=#f8f8f8 guibg=#334455 gui=NONE ctermfg=15 ctermbg=59 cterm=NONE
hi TabLineFill guifg=#111111 guibg=#111111 gui=NONE ctermfg=233 ctermbg=233 cterm=NONE

" misc
hi SpecialKey guifg=#49483e guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
hi Title guifg=#b0b200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi Directory guifg=#008081 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE

" diff
hi DiffAdd guifg=#f8f8f8 guibg=#253b22 gui=NONE ctermfg=15 ctermbg=22 cterm=NONE
hi DiffDelete guifg=#f92782 guibg=#420e09 gui=NONE ctermfg=197 ctermbg=52 cterm=NONE
hi DiffChange guifg=#b0b200 guibg=#420e09 gui=NONE ctermfg=185 ctermbg=52 cterm=NONE
hi DiffText guifg=#f8f8f8 guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE

" folding
hi Folded guifg=#778899 guibg=#211f1c gui=NONE ctermfg=103 ctermbg=00 cterm=NONE
hi FoldColumn guifg=NONE guibg=#211f1c gui=NONE ctermfg=NONE ctermbg=00 cterm=NONE

" cursor colors
hi ColorColumn guifg=NONE guibg=#223344 gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
hi CursorColumn guifg=NONE guibg=#223344 gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
hi CursorLine guifg=NONE guibg=#223344 gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
hi Cursor guifg=#111111 guibg=#f8f8f8 gui=NONE ctermfg=233 ctermbg=15 cterm=NONE
hi Visual guifg=NONE guibg=#383a3e gui=NONE ctermfg=NONE ctermbg=59 cterm=NONE
hi MatchParen guifg=#111111 guibg=#b0b200 gui=NONE ctermfg=233 ctermbg=185 cterm=NONE

" general highlighting
hi Constant guifg=#980096 guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Number guifg=#980096 guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Float guifg=#980096 guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Boolean guifg=#980096 guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Character guifg=#b0b200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi String guifg=#b0b200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi Type guifg=#008081 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Structure guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi TypeDef guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Identifier guifg=#00b200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Function guifg=#00b200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Statement guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Operator guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Label guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Keyword guifg=#008081 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Preproc guifg=#00b200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Include guifg=#008081 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Define guifg=#008081 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Macro guifg=#00b200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi PreCondit guifg=#00b200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Special guifg=#008081 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Delimiter guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Comment guifg=#4185d7 guibg=NONE gui=italic ctermfg=67 ctermbg=NONE cterm=italic
hi SpecialComment guifg=#008081 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Tag guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Underlined guifg=#00b200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Todo guifg=#f8f8f8 guibg=#111111 gui=bold ctermfg=15 ctermbg=233 cterm=bold
hi Error guifg=#f8f8f8 guibg=#df2800 gui=NONE ctermfg=15 ctermbg=88 cterm=NONE
hi ExtraWhitespace guifg=#df2800 guibg=#df2800 gui=NONE ctermfg=88 ctermbg=88 cterm=NONE

if has("nvim")
  " neovim terminal
  hi TermCursor guifg=#111111 guibg=#f8f8f8 gui=NONE ctermfg=233 ctermbg=15 cterm=NONE
  hi TermCursorNC guifg=#111111 guibg=#778899 gui=NONE ctermfg=233 ctermbg=103 cterm=NONE
endif
