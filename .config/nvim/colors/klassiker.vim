" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/colors/klassiker.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-29T19:01:34+0200

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="klassiker"

" colors used in this scheme
" GUI: #000000, Term:   0
" GUI: #df2800, Term:   1
" GUI: #00b200, Term:   2
" GUI: #b0b200, Term:   3
" GUI: #4185d7, Term:  12
" GUI: #980096, Term:   5
" GUI: #008081, Term:  12
" GUI: #ffffff, Term:  15

" GUI: #2b2b2b, Term: 234
" GUI: #333333, Term: 237
" GUI: #666666, Term: 242

" GUI: #223344, Term:  23
" GUI: #005f00, Term:  22
" GUI: #334455, Term:  59
" GUI: #5f0000, Term:  52
" GUI: #875f5f, Term:  95
" GUI: #778899, Term: 103
" GUI: #f92782, Term: 197

" popup Menu
hi Pmenu guifg=#ffffff guibg=#223344 gui=NONE ctermfg=15 ctermbg=23 cterm=NONE
hi PmenuSet guifg=#008081 guibg=#000000 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
hi PmenuSBar guifg=#008081 guibg=#334455 gui=NONE ctermfg=12 ctermbg=59 cterm=NONE
hi PmenuSel guifg=#008081 guibg=#334455 gui=NONE ctermfg=12 ctermbg=59 cterm=NONE
hi PmenuThumb guifg=#778899 guibg=#778899 gui=NONE ctermfg=103 ctermbg=103 cterm=NONE

" editor
hi Normal guifg=#ffffff guibg=#000000 gui=NONE ctermfg=15 ctermbg=0 cterm=NONE
hi Conceal guifg=#008081 guibg=#000000 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
hi NonText guifg=#334455 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#008081 guibg=#000000 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
hi StatusLineNC guifg=#778899 guibg=#000000 gui=NONE ctermfg=103 ctermbg=0 cterm=NONE
hi Search guifg=#000000 guibg=#b0b200 gui=NONE ctermfg=0 ctermbg=221 cterm=NONE
hi VertSplit guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
hi LineNr guifg=#666666 guibg=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi SignColumn guifg=NONE guibg=#2b2b2b gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE

" messages
hi Question guifg=#b0b200 guibg=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi ModeMsg guifg=#b0b200 guibg=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi MoreMsg guifg=#b0b200 guibg=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi ErrorMsg guifg=#000000 guibg=#f92782 gui=NONE ctermfg=0 ctermbg=197 cterm=NONE
hi WarningMsg guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE

" spelling
hi SpellBad guifg=#ffffff guibg=NONE gui=undercurl ctermfg=15 ctermbg=NONE cterm=undercurl guisp=#f92782
hi SpellLocal guifg=#008081 guibg=NONE gui=undercurl ctermfg=12 ctermbg=NONE cterm=undercurl guisp=#008081

" tabline
hi TabLine guifg=#666666 guibg=#000000 gui=NONE ctermfg=242 ctermbg=0 cterm=NONE
hi TabLineSel guifg=#ffffff guibg=#334455 gui=NONE ctermfg=15 ctermbg=59 cterm=NONE
hi TabLineFill guifg=#000000 guibg=#000000 gui=NONE ctermfg=0 ctermbg=0 cterm=NONE

" misc
hi SpecialKey guifg=#334455 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
hi Title guifg=#b0b200 guibg=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi Directory guifg=#008081 guibg=NONE gui=NONE ctermfg=12 ctermbg=NONE cterm=NONE

" diff
hi DiffAdd guifg=#ffffff guibg=#005f00 gui=NONE ctermfg=15 ctermbg=22 cterm=NONE
hi DiffDelete guifg=#f92782 guibg=#5f0000 gui=NONE ctermfg=197 ctermbg=52 cterm=NONE
hi DiffChange guifg=#b0b200 guibg=#5f0000 gui=NONE ctermfg=3 ctermbg=52 cterm=NONE
hi DiffText guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE

" folding
hi Folded guifg=#778899 guibg=#2b2b2b gui=NONE ctermfg=103 ctermbg=234 cterm=NONE
hi FoldColumn guifg=NONE guibg=#2b2b2b gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE

" cursor colors
hi ColorColumn guifg=NONE guibg=#223344 gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
hi CursorColumn guifg=NONE guibg=#223344 gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
hi CursorLine guifg=NONE guibg=#223344 gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
hi Cursor guifg=#000000 guibg=#ffffff gui=NONE ctermfg=0 ctermbg=15 cterm=NONE
hi Visual guifg=NONE guibg=#333333 gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
hi MatchParen guifg=#000000 guibg=#b0b200 gui=NONE ctermfg=0 ctermbg=3 cterm=NONE
if has("nvim")
  " neovim terminal
  hi TermCursor guifg=#000000 guibg=#4185d7 gui=NONE ctermfg=0 ctermbg=12 cterm=NONE
  hi TermCursorNC guifg=#000000 guibg=#778899 gui=NONE ctermfg=0 ctermbg=103 cterm=NONE
endif

" general highlighting
hi Constant guifg=#980096 guibg=NONE gui=NONE ctermfg=5 ctermbg=NONE cterm=NONE
hi Number guifg=#980096 guibg=NONE gui=NONE ctermfg=5 ctermbg=NONE cterm=NONE
hi Float guifg=#980096 guibg=NONE gui=NONE ctermfg=5 ctermbg=NONE cterm=NONE
hi Boolean guifg=#980096 guibg=NONE gui=NONE ctermfg=5 ctermbg=NONE cterm=NONE
hi Character guifg=#b0b200 guibg=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi String guifg=#b0b200 guibg=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi Type guifg=#008081 guibg=NONE gui=NONE ctermfg=12 ctermbg=NONE cterm=NONE
hi Structure guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi TypeDef guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Identifier guifg=#00b200 guibg=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi Function guifg=#00b200 guibg=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi Statement guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Operator guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Label guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Keyword guifg=#008081 guibg=NONE gui=NONE ctermfg=12 ctermbg=NONE cterm=NONE
hi Preproc guifg=#00b200 guibg=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi Include guifg=#008081 guibg=NONE gui=NONE ctermfg=12 ctermbg=NONE cterm=NONE
hi Define guifg=#008081 guibg=NONE gui=NONE ctermfg=12 ctermbg=NONE cterm=NONE
hi Macro guifg=#00b200 guibg=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi PreCondit guifg=#00b200 guibg=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi Special guifg=#008081 guibg=NONE gui=NONE ctermfg=12 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Delimiter guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Comment guifg=#4185d7 guibg=NONE gui=italic ctermfg=12 ctermbg=NONE cterm=italic
hi SpecialComment guifg=#008081 guibg=NONE gui=NONE ctermfg=12 ctermbg=NONE cterm=NONE
hi Tag guifg=#f92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Underlined guifg=#00b200 guibg=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Todo guifg=#ffffff guibg=#000000 gui=bold ctermfg=15 ctermbg=0 cterm=bold
hi Error guifg=#ffffff guibg=#df2800 gui=NONE ctermfg=15 ctermbg=1 cterm=NONE
hi ExtraWhitespace guifg=#df2800 guibg=#df2800 gui=NONE ctermfg=1 ctermbg=1 cterm=NONE
