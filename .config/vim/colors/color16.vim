" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT
" Notes: This is a project's fork. I'm setting a generic version based on xresourses colors, if you get to this file, I encourege you to use the nord-vim project, this is just my experiment.

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "color16"
let s:color16_vim_version="0.0.1"
set background=dark

let s:nord0_gui = "#2E3440"
let s:color0_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:color8_gui = "#4C566A"
let s:color8_gui_bright = "#616E88"
let s:nord4_gui = "#D8DEE9"
let s:color7_gui = "#E5E9F0"
let s:color15_gui = "#ECEFF4"
let s:color14_gui = "#8FBCBB"
let s:color6_gui = "#88C0D0"
let s:color4_gui = "#81A1C1"
let s:color12_gui = "#5E81AC"
let s:color1_gui = "#BF616A"
let s:color11_gui = "#D08770"
let s:color3_gui = "#EBCB8B"
let s:color2_gui = "#A3BE8C"
let s:color5_gui = "#B48EAD"

let s:color0_term = "0"
let s:color8_term = "8"
let s:color7_term = "7"
let s:color15_term = "15"
let s:color14_term = "14"
let s:color6_term = "6"
let s:color4_term = "4"
let s:color12_term = "12"
let s:color1_term = "1"
let s:color11_term = "11"
let s:color3_term = "3"
let s:color2_term = "2"
let s:color5_term = "5"

let s:color8_gui_brightened = [
  \ s:color8_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:color16_bold")
  let g:color16_bold = 1
endif

let s:bold = "bold,"
if g:color16_bold == 0
  let s:bold = ""
endif

if !exists("g:color16_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:color16_italic = 1
  else
    let g:color16_italic = 0
  endif
endif

let s:italic = "italic,"
if g:color16_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "color16_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:color16_italic_comments")
  if g:color16_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:color16_uniform_status_lines')
  let g:color16_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'nord: warning: ' . a:msg
  echohl None
endfunction

if exists("g:color16_comment_brightness")
  call s:logWarning('Variable g:color16_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                   \' The comment color brightness has been increased by 10% by default.' .
                   \' Please see https://github.com/arcticicestudio/nord-vim/issues/145 for more details.')
  let g:color16_comment_brightness = 10
endif

if !exists("g:color16_uniform_diff_background")
  let g:color16_uniform_diff_background = 0
endif

if !exists("g:color16_cursor_line_number_background")
  let g:color16_cursor_line_number_background = 0
endif

if !exists("g:color16_bold_vertical_split_line")
  let g:color16_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:color0_gui, "NONE", s:color0_term, "", "")
call s:hi("Cursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:color0_gui, "NONE", s:color0_term, "NONE", "")
call s:hi("Error", s:nord4_gui, s:color1_gui, "", s:color1_term, "", "")
call s:hi("iCursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:color8_gui, "NONE", s:color8_term, "NONE", "", "")
call s:hi("MatchParen", s:color6_gui, s:color8_gui, s:color6_term, s:color8_term, "", "")
call s:hi("NonText", s:nord2_gui, "", s:color8_term, "", "", "")
call s:hi("Normal", s:nord4_gui, s:nord0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:nord4_gui, s:nord2_gui, "NONE", s:color0_term, "NONE", "")
call s:hi("PmenuSbar", s:nord4_gui, s:nord2_gui, "NONE", s:color0_term, "", "")
call s:hi("PMenuSel", s:color6_gui, s:color8_gui, s:color6_term, s:color8_term, "", "")
call s:hi("PmenuThumb", s:color6_gui, s:color8_gui, "NONE", s:color8_term, "", "")
call s:hi("SpecialKey", s:color8_gui, "", s:color8_term, "", "", "")
call s:hi("SpellBad", s:color1_gui, s:nord0_gui, s:color1_term, "NONE", "undercurl", s:color1_gui)
call s:hi("SpellCap", s:color3_gui, s:nord0_gui, s:color3_term, "NONE", "undercurl", s:color3_gui)
call s:hi("SpellLocal", s:color7_gui, s:nord0_gui, s:color7_term, "NONE", "undercurl", s:color7_gui)
call s:hi("SpellRare", s:color15_gui, s:nord0_gui, s:color15_term, "NONE", "undercurl", s:color15_gui)
call s:hi("Visual", "", s:nord2_gui, "", s:color0_term, "", "")
call s:hi("VisualNOS", "", s:nord2_gui, "", s:color0_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:color1_gui, s:color0_gui, s:color1_term, s:color0_term, "", "")
call s:hi("healthSuccess", s:color2_gui, s:color0_gui, s:color2_term, s:color0_term, "", "")
call s:hi("healthWarning", s:color3_gui, s:color0_gui, s:color3_term, s:color0_term, "", "")
call s:hi("TermCursorNC", "", s:color0_gui, "", s:color0_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:color0_gui, s:color1_gui, s:color2_gui, s:color3_gui, s:color4_gui, s:color5_gui, s:color6_gui, s:color7_gui, s:color8_gui, s:color1_gui, s:color2_gui, s:color3_gui, s:color4_gui, s:color5_gui, s:color14_gui, s:color15_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:color0_gui
  let g:terminal_color_1 = s:color1_gui
  let g:terminal_color_2 = s:color2_gui
  let g:terminal_color_3 = s:color3_gui
  let g:terminal_color_4 = s:color4_gui
  let g:terminal_color_5 = s:color5_gui
  let g:terminal_color_6 = s:color6_gui
  let g:terminal_color_7 = s:color7_gui
  let g:terminal_color_8 = s:color8_gui
  let g:terminal_color_9 = s:color1_gui
  let g:terminal_color_10 = s:color2_gui
  let g:terminal_color_11 = s:color3_gui
  let g:terminal_color_12 = s:color4_gui
  let g:terminal_color_13 = s:color5_gui
  let g:terminal_color_14 = s:color14_gui
  let g:terminal_color_15 = s:color15_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:color0_gui, "NONE", s:color0_term, "", "")
if g:color16_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:nord4_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:nord4_gui, s:color0_gui, "NONE", s:color0_term, "NONE", "")
endif
call s:hi("Folded", s:color8_gui, s:color0_gui, s:color8_term, s:color0_term, s:bold, "")
call s:hi("FoldColumn", s:color8_gui, s:nord0_gui, s:color8_term, "NONE", "", "")
call s:hi("SignColumn", s:color0_gui, s:nord0_gui, s:color0_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:color6_gui, "", s:color6_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:color0_gui, "", s:color0_term, "NONE", "", "")
call s:hi("ErrorMsg", s:nord4_gui, s:color1_gui, "NONE", s:color1_term, "", "")
call s:hi("ModeMsg", s:nord4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("Question", s:nord4_gui, "", "NONE", "", "", "")
if g:color16_uniform_status_lines == 0
  call s:hi("StatusLine", s:color6_gui, s:color8_gui, s:color6_term, s:color8_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:color0_gui, "NONE", s:color0_term, "NONE", "")
  call s:hi("StatusLineTerm", s:color6_gui, s:color8_gui, s:color6_term, s:color8_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:color0_gui, "NONE", s:color0_term, "NONE", "")
else
  call s:hi("StatusLine", s:color6_gui, s:color8_gui, s:color6_term, s:color8_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:color8_gui, "NONE", s:color8_term, "NONE", "")
  call s:hi("StatusLineTerm", s:color6_gui, s:color8_gui, s:color6_term, s:color8_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:color8_gui, "NONE", s:color8_term, "NONE", "")
endif
call s:hi("WarningMsg", s:nord0_gui, s:color3_gui, s:color0_term, s:color3_term, "", "")
call s:hi("WildMenu", s:color6_gui, s:color0_gui, s:color6_term, s:color0_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:color15_gui, s:color12_gui, s:color15_term, s:color12_term, s:underline, "")
call s:hi("Search", s:color0_gui, s:color6_gui, s:color0_term, s:color6_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:nord4_gui, s:color0_gui, "NONE", s:color0_term, "NONE", "")
call s:hi("TabLineFill", s:nord4_gui, s:color0_gui, "NONE", s:color0_term, "NONE", "")
call s:hi("TabLineSel", s:color6_gui, s:color8_gui, s:color6_term, s:color8_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:nord4_gui, "", "NONE", "", "NONE", "")

if g:color16_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:nord2_gui, s:nord0_gui, s:color8_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:nord2_gui, s:color0_gui, s:color8_term, s:color0_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Character", s:color2_gui, "", s:color2_term, "", "", "")
call s:hi("Comment", s:color8_gui_bright, "", s:color8_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Constant", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Delimiter", s:color15_gui, "", s:color15_term, "", "", "")
call s:hi("Exception", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Float", s:color5_gui, "", s:color5_term, "", "", "")
call s:hi("Function", s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("Identifier", s:nord4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Keyword", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Label", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Number", s:color5_gui, "", s:color5_term, "", "", "")
call s:hi("Operator", s:color4_gui, "", s:color4_term, "", "NONE", "")
call s:hi("PreProc", s:color4_gui, "", s:color4_term, "", "NONE", "")
call s:hi("Repeat", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Special", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:color3_gui, "", s:color3_term, "", "", "")
call s:hi("SpecialComment", s:color6_gui, "", s:color6_term, "", s:italicize_comments, "")
call s:hi("Statement", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("StorageClass", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("String", s:color2_gui, "", s:color2_term, "", "", "")
call s:hi("Structure", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("Tag", s:nord4_gui, "", "", "", "", "")
call s:hi("Todo", s:color3_gui, "NONE", s:color3_term, "NONE", "", "")
call s:hi("Type", s:color4_gui, "", s:color4_term, "", "NONE", "")
call s:hi("Typedef", s:color4_gui, "", s:color4_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:color12_gui, "", s:color12_term, "", "", "")
call s:hi("asciidocAttributeList", s:color12_gui, "", s:color12_term, "", "", "")
call s:hi("asciidocAttributeRef", s:color12_gui, "", s:color12_term, "", "", "")
call s:hi("asciidocHLabel", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("asciidocListingBlock", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:color4_gui, "", s:color4_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:color14_gui, "", s:color14_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("awkPatterns", s:color4_gui, "", s:color4_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:color14_gui, "", s:color14_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:color12_gui, "", s:color12_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("cssDefinition", s:color14_gui, "", s:color14_term, "", "NONE", "")
call s:hi("cssIdentifier", s:color14_gui, "", s:color14_term, "", s:underline, "")
call s:hi("cssStringQ", s:color14_gui, "", s:color14_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:color6_gui, "", s:color6_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("dtExecKey", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("dtLocaleKey", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("dtNumericKey", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("dtTypeKey", s:color14_gui, "", s:color14_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:color16_uniform_diff_background == 0
  call s:hi("DiffAdd", s:color2_gui, s:nord0_gui, s:color2_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:color3_gui, s:nord0_gui, s:color3_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:color1_gui, s:nord0_gui, s:color1_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:color4_gui, s:nord0_gui, s:color4_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:color2_gui, s:color0_gui, s:color2_term, s:color0_term, "", "")
  call s:hi("DiffChange", s:color3_gui, s:color0_gui, s:color3_term, s:color0_term, "", "")
  call s:hi("DiffDelete", s:color1_gui, s:color0_gui, s:color1_term, s:color0_term, "", "")
  call s:hi("DiffText", s:color4_gui, s:color0_gui, s:color4_term, s:color0_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:color14_gui, "", s:color14_term, "", "", "")

call s:hi("goBuiltins", s:color14_gui, "", s:color14_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:color8_gui, "", s:color8_term, "", "", "")
call s:hi("helpHyperTextJump", s:color6_gui, "", s:color6_term, "", s:underline, "")

call s:hi("htmlArg", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("htmlLink", s:nord4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:color14_gui, "", s:color14_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:color14_gui, "", s:color14_term, "", "", "")

call s:hi("lessClass", s:color14_gui, "", s:color14_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("markdownCode", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("markdownFootnote", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("markdownId", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("markdownIdDeclaration", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("markdownH1", s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("markdownLinkText", s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("markdownUrl", s:nord4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:color14_gui, "", s:color14_term, "", "", "")

call s:hi("phpClasses", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("phpDocTags", s:color14_gui, "", s:color14_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("podVerbatimLine", s:nord4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("rubySymbol", s:color15_gui, "", s:color15_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:color12_gui, "", s:color12_term, "", "", "")
call s:hi("rustEnum", s:color14_gui, "", s:color14_term, "", s:bold, "")
call s:hi("rustMacro", s:color6_gui, "", s:color6_term, "", s:bold, "")
call s:hi("rustModPath", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("rustPanic", s:color4_gui, "", s:color4_term, "", s:bold, "")
call s:hi("rustTrait", s:color14_gui, "", s:color14_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("sassId", s:color14_gui, "", s:color14_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("vimMapRhs", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("vimNotation", s:color14_gui, "", s:color14_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("xmlCdataStart", s:color8_gui_bright, "", s:color8_term, "", s:bold, "")
call s:hi("xmlNamespace", s:color14_gui, "", s:color14_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:color14_gui, "", s:color14_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:color3_gui, "", s:color3_term, "", "", "")
call s:hi("ALEErrorSign" , s:color1_gui, "", s:color1_term, "", "", "")
call s:hi("ALEWarning" , s:color3_gui, "", s:color3_term, "", "undercurl", "")
call s:hi("ALEError" , s:color1_gui, "", s:color1_term, "", "undercurl", "")

" Coc
" > neoclide/coc
call s:hi("CocWarningSign", s:color3_gui, "", s:color3_term, "", "", "")
call s:hi("CocErrorSign" , s:color1_gui, "", s:color1_term, "", "", "")
call s:hi("CocInfoSign" , s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("CocHintSign" , s:color12_gui, "", s:color12_term, "", "", "")

" Nvim LSP
" > neovim/nvim-lsp
call s:hi("LSPDiagnosticsWarning", s:color3_gui, "", s:color3_term, "", "", "")
call s:hi("LSPDiagnosticsError" , s:color1_gui, "", s:color1_term, "", "", "")
call s:hi("LSPDiagnosticsInformation" , s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("LSPDiagnosticsHint" , s:color12_gui, "", s:color12_term, "", "", "")


" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:color2_gui, "", s:color2_term, "", "", "")
call s:hi("GitGutterChange", s:color3_gui, "", s:color3_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:color1_gui, "", s:color1_term, "", "", "")
call s:hi("GitGutterDelete", s:color1_gui, "", s:color1_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:color2_gui, "", s:color2_term, "", "", "")
call s:hi("SignifySignChange", s:color3_gui, "", s:color3_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:color1_gui, "", s:color1_term, "", "", "")
call s:hi("SignifySignDelete", s:color1_gui, "", s:color1_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:color1_gui, "", s:color1_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:color1_gui, "", s:color1_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:color2_gui, "", s:color2_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:nord4_gui, s:color8_gui, "", s:color8_term, "", "")
call s:hi("jediFat", s:color6_gui, s:color8_gui, s:color6_term, s:color8_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:color14_gui, "", s:color14_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:color1_gui, "", "", s:color1_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:color6_gui, "", s:color6_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:color15_gui, "", s:color15_term, "", "", "")
call s:hi("StartifyFooter", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("StartifyHeader", s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("StartifyNumber", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("StartifyPath", s:color6_gui, "", s:color6_term, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:color12_gui, "", s:color12_term, "", "", "")
call s:hi("haskellType", s:color14_gui, "", s:color14_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:color6_gui, "", s:color6_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:color14_gui, "", s:color14_term, "", "", "")
call s:hi("mkdFootnote", s:color6_gui, "", s:color6_term, "", "", "")
call s:hi("mkdRule", s:color12_gui, "", s:color12_term, "", "", "")
call s:hi("mkdLineBreak", s:color4_gui, "", s:color4_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:color6_gui, "", s:color6_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:color14_gui, s:color6_gui, s:color4_gui, s:color12_gui, s:color2_gui, s:color5_gui]
  let s:vimwiki_hcolor_ctermfg = [s:color14_term, s:color6_term, s:color4_term, s:color12_term, s:color2_term, s:color5_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:color6_gui, "", s:color6_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:color14_gui, "", s:color14_term, "", "", "")
