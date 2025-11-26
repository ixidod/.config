local api = vim.api

vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then
  vim.cmd('syntax reset')
end

vim.o.termguicolors = false
vim.g.colors_name = 'ixidod_min'

local function hi(group, opts)
  api.nvim_set_hl(0, group, opts or {})
end

-- core UI
hi('Normal',        {})
hi('NormalFloat',   {})
hi('SignColumn',    {})
hi('LineNr',        {})
hi('CursorLineNr',  {})
hi('EndOfBuffer',   {})

-- statusline / tabline / separators
hi('StatusLine',    { fg = 'Black', bg = 'White' })   -- active: black text on white bar
hi('StatusLineNC',  { fg = 'White', bg = 'Black' })   -- inactive: white on black
hi('TabLine',       {})
hi('TabLineFill',   {})
hi('TabLineSel',    {})
hi('WinSeparator',  {})
hi('VertSplit',     {})

-- message areas
hi('ModeMsg',       {})
hi('MsgArea',       {})
hi('MsgSeparator',  {})

-- selections / matches
hi('Visual',        { reverse = true })
hi('Search',        { reverse = true })
hi('IncSearch',     { reverse = true })
hi('MatchParen',    { underline = true })

-- errors / warnings (monochrome)
hi('ErrorMsg',      { underline = true })
hi('WarningMsg',    { underline = true })

-- syntax groups forced to Normal
local syntax_groups = {
  'Comment',
  'Constant','String','Character','Number','Boolean','Float',
  'Identifier','Function',
  'Statement','Conditional','Repeat','Label','Operator','Keyword','Exception',
  'PreProc','Include','Define','Macro','PreCondit',
  'Type','StorageClass','Structure','Typedef',
  'Special','SpecialChar','Tag','Delimiter','SpecialComment','Debug',
}

for _, grp in ipairs(syntax_groups) do
  hi(grp, { link = 'Normal' })
end

-- diagnostics
hi('DiagnosticError', { link = 'Normal' })
hi('DiagnosticWarn',  { link = 'Normal' })
hi('DiagnosticInfo',  { link = 'Normal' })
hi('DiagnosticHint',  { link = 'Normal' })
hi('DiagnosticOk',    { link = 'Normal' })

hi('DiagnosticSignError', { link = 'Normal' })
hi('DiagnosticSignWarn',  { link = 'Normal' })
hi('DiagnosticSignInfo',  { link = 'Normal' })
hi('DiagnosticSignHint',  { link = 'Normal' })
hi('DiagnosticSignOk',    { link = 'Normal' })

hi('DiagnosticUnderlineError', { underline = true })
hi('DiagnosticUnderlineWarn',  { underline = true })
hi('DiagnosticUnderlineInfo',  { underline = true })
hi('DiagnosticUnderlineHint',  { underline = true })
hi('DiagnosticUnderlineOk',    { underline = true })

