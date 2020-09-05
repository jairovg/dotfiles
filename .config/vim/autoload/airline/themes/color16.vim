" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

let s:color16_vim_version="0.0.1"
let g:airline#themes#color16#palette = {}

let s:nord0_gui = "#2E3440"
let s:color0_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:color8_gui = "#4C566A"
let s:nord4_gui = "#D8DEE9"
let s:color7_gui = "#E5E9F0"
let s:color15_gui = "#ECEFF4"
let s:color14_gui = "#8FBCBB"
let s:color6_gui = "#88C0D0"
let s:color4_gui = "#81A1C1"
let s:nord10_gui = "#5E81AC"
let s:color1_gui = "#BF616A"
let s:nord12_gui = "#D08770"
let s:color3_gui = "#EBCB8B"
let s:color2_gui = "#A3BE8C"
let s:color5_gui = "#B48EAD"

let s:nord0_term = "NONE"
let s:color0_term = "0"
let s:nord2_term = "NONE"
let s:nord4_term = "NONE"
let s:color1_term = "1"
let s:color2_term = "2"
let s:color3_term = "3"
let s:color4_term = "4"
let s:color5_term = "5"
let s:color6_term = "6"
let s:color7_term = "7"
let s:color8_term = "8"
let s:nord12_term = "11"
let s:nord10_term = "12"
let s:color14_term = "14"
let s:color15_term = "15"

let s:NMain = [s:color0_gui, s:color6_gui, s:color0_term, s:color6_term]
let s:NRight = [s:color0_gui, s:color4_gui, s:color0_term, s:color4_term]
let s:NMiddle = [s:color7_gui, s:color8_gui, s:color7_term, s:color8_term]
let s:NWarn = [s:color0_gui, s:color3_gui, s:color8_term, s:color3_term]
let s:NError = [s:nord0_gui, s:color1_gui, s:color0_term, s:color1_term]
let g:airline#themes#color16#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#color16#palette.normal.airline_warning = s:NWarn
let g:airline#themes#color16#palette.normal.airline_error = s:NError

let s:IMain = [s:color0_gui, s:color2_gui, s:color0_term, s:color15_term]
let s:IRight = [s:color0_gui, s:color4_gui, s:color0_term, s:color4_term]
let s:IMiddle = [s:color7_gui, s:color8_gui, s:color7_term, s:color8_term]
let s:IWarn = [s:color0_gui, s:color3_gui, s:color8_term, s:color3_term]
let s:IError = [s:nord0_gui, s:color1_gui, s:color0_term, s:color1_term]
let g:airline#themes#color16#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#color16#palette.insert.airline_warning = s:IWarn
let g:airline#themes#color16#palette.insert.airline_error = s:IError

let s:RMain = [s:color0_gui, s:color2_gui, s:color0_term, s:color2_term]
let s:RRight = [s:color0_gui, s:color4_gui, s:color0_term, s:color4_term]
let s:RMiddle = [s:color7_gui, s:color8_gui, s:color7_term, s:color8_term]
let s:RWarn = [s:color0_gui, s:color3_gui, s:color8_term, s:color3_term]
let s:RError = [s:nord0_gui, s:color1_gui, s:color0_term, s:color1_term]
let g:airline#themes#color16#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#color16#palette.replace.airline_warning = s:RWarn
let g:airline#themes#color16#palette.replace.airline_error = s:RError

let s:VMain = [s:color0_gui, s:color14_gui, s:color0_term, s:color14_term]
let s:VRight = [s:color0_gui, s:color4_gui, s:color0_term, s:color4_term]
let s:VMiddle = [s:color7_gui, s:color8_gui, s:color7_term, s:color8_term]
let s:VWarn = [s:color0_gui, s:color3_gui, s:color8_term, s:color3_term]
let s:VError = [s:nord0_gui, s:color1_gui, s:color0_term, s:color1_term]
let g:airline#themes#color16#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#color16#palette.visual.airline_warning = s:VWarn
let g:airline#themes#color16#palette.visual.airline_error = s:VError

let s:IAMain = [s:color7_gui, s:color8_gui, s:color7_term, s:color8_term]
let s:IARight = [s:color7_gui, s:color8_gui, s:color7_term, s:color8_term]
if g:color16_uniform_status_lines == 0
  let s:IAMiddle = [s:color7_gui, s:color0_gui, s:color7_term, s:color0_term]
else
  let s:IAMiddle = [s:color7_gui, s:color8_gui, s:color7_term, s:color8_term]
endif
let s:IAWarn = [s:color0_gui, s:color3_gui, s:color8_term, s:color3_term]
let s:IAError = [s:nord0_gui, s:color1_gui, s:color0_term, s:color1_term]
let g:airline#themes#color16#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#color16#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#color16#palette.inactive.airline_error = s:IAError

let g:airline#themes#color16#palette.normal.airline_term = s:NMiddle
let g:airline#themes#color16#palette.insert.airline_term = s:IMiddle
let g:airline#themes#color16#palette.replace.airline_term = s:RMiddle
let g:airline#themes#color16#palette.visual.airline_term = s:VMiddle
let g:airline#themes#color16#palette.inactive.airline_term = s:IAMiddle
