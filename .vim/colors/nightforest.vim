" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	John Blakeney <blakeney@alum.mit.edu>
" Last Change:	2015 February 24
" Based on the koehler colorscheme by Ron Aaron

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nightforest"
hi Normal		  guifg=green  guibg=black
hi Scrollbar	  guifg=darkgreen guibg=green
hi Menu			  guifg=black guibg=green
hi SpecialKey	  term=bold  cterm=bold  ctermfg=darkred  guifg=darkred
hi NonText		  term=bold  cterm=bold  ctermfg=darkred  gui=bold      guifg=darkred
hi Directory	  term=bold  cterm=bold  ctermfg=brown  guifg=brown
hi ErrorMsg		  term=standout  cterm=bold  ctermfg=grey  ctermbg=red  guifg=green  guibg=Red
hi Search		  term=reverse  ctermfg=black  ctermbg=yellow      guifg=black  guibg=yellow
hi MoreMsg		  term=bold  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=SeaGreen
hi ModeMsg		  term=bold  cterm=bold  gui=bold  guifg=green	guibg=black
hi LineNr		  term=underline  cterm=bold  ctermfg=darkgreen	guifg=darkgreen
hi Question		  term=standout  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=Green
hi StatusLine	  term=bold,reverse  cterm=bold ctermfg=black ctermbg=green gui=bold guifg=black guibg=green
hi StatusLineNC   term=reverse	ctermfg=green ctermbg=black guifg=green guibg=black
hi Title		  term=bold  cterm=bold  ctermfg=darkmagenta  gui=bold	guifg=Magenta
hi Visual		  term=reverse	cterm=reverse  gui=reverse
hi WarningMsg	  term=standout  cterm=bold  ctermfg=darkred guifg=Red
hi Cursor		  guifg=bg	guibg=Green
hi Comment		  term=bold  cterm=bold ctermfg=magenta  guifg=magenta
hi Constant		  term=underline  cterm=bold ctermfg=magenta  guifg=magenta
hi Special		  term=bold  cterm=bold ctermfg=red  guifg=Orange
hi Identifier	  term=underline   ctermfg=brown  guifg=brown
hi Statement	  term=bold  cterm=bold ctermfg=yellow	gui=bold  guifg=yellow
hi PreProc		  term=underline  ctermfg=darkmagenta   guifg=darkmagenta
hi Type			  term=underline  cterm=bold ctermfg=lightgreen  gui=bold  guifg=lightgreen
hi Error		  term=reverse	ctermfg=darkgreen  ctermbg=black  guifg=Red	guibg=Black
hi Todo			  term=standout  ctermfg=black	ctermbg=darkgreen  guifg=black  guibg=Yellow
hi CursorLine	  term=underline  guibg=yellow guifg=black cterm=underline
hi CursorColumn	  term=underline  guibg=yellow guifg=black cterm=underline
hi MatchParen	  term=reverse  gui=reverse
hi TabLine		  term=bold,reverse  cterm=bold ctermfg=black ctermbg=green gui=bold guifg=black guibg=green
hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=black ctermbg=green gui=bold guifg=black guibg=green
hi TabLineSel	  term=reverse	ctermfg=green ctermbg=black guifg=green guibg=black
hi Underlined	  term=underline cterm=bold,underline ctermfg=yellow guifg=black gui=bold,underline
hi Ignore		  ctermfg=black ctermbg=black guifg=black guibg=black
hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special
