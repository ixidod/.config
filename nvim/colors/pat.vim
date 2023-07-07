set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "pat"
"to see highlight groups type so $VIMRUNTIME/syntax/hitest.vim
hi Normal       ctermfg=LightGray ctermbg=None guifg=#dddddd    guibg=Black
hi Comment      cterm=NONE ctermfg=37
hi Constant     cterm=NONE ctermfg=LightGray
hi Identifier   cterm=NONE ctermfg=LightGray
hi Function     cterm=NONE ctermfg=LightGray
hi Statement    cterm=NONE ctermfg=LightGray
hi PreProc      cterm=NONE ctermfg=LightGray
hi Type         cterm=NONE ctermfg=LightGray
hi Special      cterm=NONE ctermfg=LightGray
hi Delimiter    cterm=NONE ctermfg=LightGray
hi String       cterm=NONE ctermfg=LightGray
hi LineNr       cterm=NONE ctermfg=8 ctermbg=NONE
hi MatchParen   cterm=NONE ctermfg=6 ctermbg=NONE
hi CursorLine   cterm=bold ctermbg=015 ctermfg=234
hi CursorColumn cterm=NONE ctermbg=006 ctermfg=NONE
hi Visual       cterm=NONE ctermbg=015 ctermfg=NONE
hi EndOfBuffer  cterm=NONE ctermfg=LightGray
hi Pmenu        cterm=NONE ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
hi StatusLine   cterm=NONE ctermfg=202  ctermbg=8
hi VertSplit    cterm=NONE ctermbg=NONE guibg=NONE cterm=NONE
hi PmenuSel     cterm=NONE ctermfg=242 ctermbg=0 guibg=DarkGrey
hi PmenuThumb   cterm=NONE ctermbg=15 guibg=White
hi PmenuSbar    cterm=NONE ctermbg=248 guibg=Grey
hi ModeMsg      cterm=NONE ctermbg=NONE ctermfg=202
