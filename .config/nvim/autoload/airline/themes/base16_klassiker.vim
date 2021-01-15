" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/autoload/airline/themes/base16_klassiker.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-01-15T12:49:38+0100

let s:gui00 = "#1f2022"
let s:gui01 = "#282828"
let s:gui02 = "#444155"
let s:gui03 = "#585858"
let s:gui04 = "#b8b8b8"
let s:gui05 = "#a3a3a3"
let s:gui06 = "#e8e8e8"
let s:gui07 = "#f8f8f8"
let s:gui08 = "#df2800"
let s:gui09 = "#b0b200"
let s:gui0A = "#effd5f"
let s:gui0B = "#1f5393"
let s:gui0C = "#3476a4"
let s:gui0D = "#4185d7"
let s:gui0E = "#980096"
let s:gui0F = "#ff5555"

let s:cterm00 = 0
let s:cterm01 = 18
let s:cterm02 = 19
let s:cterm03 = 8
let s:cterm04 = 20
let s:cterm05 = 7
let s:cterm06 = 21
let s:cterm07 = 15
let s:cterm08 = 1
let s:cterm09 = 3
let s:cterm0A = 11
let s:cterm0B = 4
let s:cterm0C = 6
let s:cterm0D = 2
let s:cterm0E = 5
let s:cterm0F = 9

let g:airline#themes#base16_klassiker#palette = {}

" background for branch and file format blocks
let s:cterm_termbg    = s:cterm02
let s:gui_termbg      = s:gui02
" foreground for branch and file format blocks
let s:cterm_termfg    = s:cterm06
let s:gui_termfg      = s:gui06


" background for middle block
let s:cterm_termbg2   = s:cterm00
let s:gui_termbg2     = s:gui00
" foreground for middle block
let s:cterm_termfg2   = s:cterm06
let s:gui_termfg2     = s:gui06


" background for normal mode and file position blocks
let s:cterm_normalbg  = s:cterm0D
let s:gui_normalbg    = s:gui0D
" foreground for normal mode and file position blocks
let s:cterm_normalfg  = s:cterm07
let s:gui_normalfg    = s:gui07


" background for insert mode and file position blocks
let s:cterm_insertbg  = s:cterm0B
let s:gui_insertbg    = s:gui0B
" foreground for insert mode and file position blocks
let s:cterm_insertfg  = s:cterm07
let s:gui_insertfg    = s:gui07


" background for visual mode and file position blocks
let s:cterm_visualbg  = s:cterm09
let s:gui_visualbg    = s:gui09
" foreground for visual mode and file position blocks
let s:cterm_visualfg  = s:cterm07
let s:gui_visualfg    = s:gui07


" background for replace mode and file position blocks
let s:cterm_replacebg = s:cterm08
let s:gui_replacebg   = s:gui08
" foreground for replace mode and file position blocks
let s:cterm_replacefg = s:cterm07
let s:gui_replacefg   = s:gui07


" background for inactive mode
let s:cterm_inactivebg = s:cterm02
let s:gui_inactivebg   = s:gui02
" foreground for inactive mode
let s:cterm_inactivefg = s:cterm04
let s:gui_inactivefg   = s:gui04


" branch and file format
let s:BB = [s:gui_termfg, s:gui_termbg, s:cterm_termfg, s:cterm_termbg] " branch and file format blocks

" normal mode
let s:N1 = [s:gui_normalfg, s:gui_normalbg, s:cterm_normalfg, s:cterm_normalbg] " outside blocks in normal mode
let s:N2 = [s:gui_termfg2, s:gui_termbg2, s:cterm_normalbg, s:cterm_termbg2]     " middle block
let g:airline#themes#base16_klassiker#palette.normal = airline#themes#generate_color_map(s:N1, s:BB, s:N2)
let g:airline#themes#base16_klassiker#palette.normal_modified = g:airline#themes#base16_klassiker#palette.normal

" insert mode
let s:I1 = [s:gui_insertfg, s:gui_insertbg, s:cterm_insertfg, s:cterm_insertbg] " outside blocks in insert mode
let s:I2 = [s:gui_insertbg, s:gui_termbg2, s:cterm_insertbg, s:cterm_termbg2]   " middle block
let g:airline#themes#base16_klassiker#palette.insert = airline#themes#generate_color_map(s:I1, s:BB, s:I2)
let g:airline#themes#base16_klassiker#palette.insert_modified = g:airline#themes#base16_klassiker#palette.insert

" replace mode
let s:R1 = [s:gui_replacefg, s:gui_replacebg, s:cterm_replacefg, s:cterm_replacebg]  " outside blocks in replace mode
let s:R2 = [s:gui_termfg, s:gui_termbg2, s:cterm_termfg, s:cterm_termbg2]            " middle block
let g:airline#themes#base16_klassiker#palette.replace = airline#themes#generate_color_map(s:R1, s:BB, s:R2)
let g:airline#themes#base16_klassiker#palette.replace_modified = g:airline#themes#base16_klassiker#palette.replace

" visual mode
let s:V1 = [s:gui_visualfg, s:gui_visualbg, s:cterm_visualfg, s:cterm_visualbg] " outside blocks in visual mode
let s:V2 = [s:gui_visualbg, s:gui_termbg2, s:cterm_visualbg, s:cterm_termbg2]   " middle block
let g:airline#themes#base16_klassiker#palette.visual = airline#themes#generate_color_map(s:V1, s:BB, s:V2)
let g:airline#themes#base16_klassiker#palette.visual_modified = g:airline#themes#base16_klassiker#palette.visual

" inactive mode
let s:IA1 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let s:IA2 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let s:IA3 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let g:airline#themes#base16_klassiker#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" warnings
let s:WI = [s:gui07, s:gui09, s:cterm07, s:cterm09]
let g:airline#themes#base16_klassiker#palette.normal.airline_warning = [
     \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
     \ ]

let g:airline#themes#base16_klassiker#palette.normal_modified.airline_warning =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_warning

let g:airline#themes#base16_klassiker#palette.insert.airline_warning =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_warning

let g:airline#themes#base16_klassiker#palette.insert_modified.airline_warning =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_warning

let g:airline#themes#base16_klassiker#palette.visual.airline_warning =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_warning

let g:airline#themes#base16_klassiker#palette.visual_modified.airline_warning =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_warning

let g:airline#themes#base16_klassiker#palette.replace.airline_warning =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_warning

let g:airline#themes#base16_klassiker#palette.replace_modified.airline_warning =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_warning

" errors
let s:ER = [s:gui07, s:gui08, s:cterm07, s:cterm08]
let g:airline#themes#base16_klassiker#palette.normal.airline_error = [
     \ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
     \ ]

let g:airline#themes#base16_klassiker#palette.normal_modified.airline_error =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_error

let g:airline#themes#base16_klassiker#palette.insert.airline_error =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_error

let g:airline#themes#base16_klassiker#palette.insert_modified.airline_error =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_error

let g:airline#themes#base16_klassiker#palette.visual.airline_error =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_error

let g:airline#themes#base16_klassiker#palette.visual_modified.airline_error =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_error

let g:airline#themes#base16_klassiker#palette.replace.airline_error =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_error

let g:airline#themes#base16_klassiker#palette.replace_modified.airline_error =
    \ g:airline#themes#base16_klassiker#palette.normal.airline_error
