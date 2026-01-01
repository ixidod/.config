-- Nord colorscheme for 256-color terminals
-- https://www.nordtheme.com

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "nord"
vim.o.background = "dark"

-- Nord palette (256-color approximations)
-- Polar Night: 236, 237, 238, 240
-- Snow Storm:  188, 255, 255
-- Frost:       109, 110, 109, 67
-- Aurora:      131 (red), 173 (orange), 222 (yellow), 144 (green), 139 (purple)

local hi = function(group, opts)
  local cmd = "hi " .. group
  if opts.fg then cmd = cmd .. " ctermfg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " ctermbg=" .. opts.bg end
  if opts.attr then cmd = cmd .. " cterm=" .. opts.attr end
  vim.cmd(cmd)
end

local link = function(from, to)
  vim.cmd("hi! link " .. from .. " " .. to)
end

-- Editor
hi("Normal",       { fg = 188, bg = 236 })
hi("NormalFloat",  { fg = 188, bg = 237 })
hi("FloatBorder",  { fg = 110, bg = 237 })
hi("FloatTitle",   { fg = 110, bg = 237, attr = "bold" })
hi("Cursor",       { fg = 236, bg = 188 })
hi("CursorLine",   { bg = 237 })
hi("CursorColumn", { bg = 237 })
hi("CursorLineNr", { fg = 188, attr = "bold" })
hi("LineNr",       { fg = 240 })
hi("SignColumn",   { fg = 237, bg = 236 })
hi("ColorColumn",  { bg = 237 })
hi("VertSplit",    { fg = 238, bg = 236 })
hi("WinSeparator", { fg = 238, bg = 236 })

-- Statusline
hi("StatusLine",   { fg = 188, bg = 238 })
hi("StatusLineNC", { fg = 240, bg = 237 })

-- Tabline
hi("TabLine",     { fg = 188, bg = 237 })
hi("TabLineFill", { bg = 237 })
hi("TabLineSel",  { fg = 188, bg = 238, attr = "bold" })

-- Pmenu (completion/popup menu)
hi("Pmenu",          { fg = 188, bg = 237 })
hi("PmenuSel",       { fg = 236, bg = 110 })
hi("PmenuSbar",      { bg = 238 })
hi("PmenuThumb",     { bg = 110 })
hi("PmenuKind",      { fg = 139, bg = 237 })
hi("PmenuKindSel",   { fg = 236, bg = 110 })
hi("PmenuExtra",     { fg = 240, bg = 237 })
hi("PmenuExtraSel",  { fg = 237, bg = 110 })

-- Search
hi("Search",     { fg = 236, bg = 222 })
hi("IncSearch",  { fg = 236, bg = 173 })
hi("CurSearch",  { fg = 236, bg = 173 })
hi("Substitute", { fg = 236, bg = 131 })

-- Visual
hi("Visual",    { bg = 238 })
hi("VisualNOS", { bg = 238 })

-- Folding
hi("Folded",     { fg = 240, bg = 237 })
hi("FoldColumn", { fg = 240, bg = 236 })

-- Diff
hi("DiffAdd",    { fg = 144, bg = 237 })
hi("DiffChange", { fg = 222, bg = 237 })
hi("DiffDelete", { fg = 131, bg = 237 })
hi("DiffText",   { fg = 222, bg = 238 })

-- Messages
hi("ErrorMsg",   { fg = 131, attr = "bold" })
hi("WarningMsg", { fg = 222, attr = "bold" })
hi("ModeMsg",    { fg = 188, attr = "bold" })
hi("MoreMsg",    { fg = 110 })
hi("Question",   { fg = 144 })

-- Spelling
hi("SpellBad",   { fg = 131, attr = "underline" })
hi("SpellCap",   { fg = 222, attr = "underline" })
hi("SpellLocal", { fg = 109, attr = "underline" })
hi("SpellRare",  { fg = 139, attr = "underline" })

-- Misc
hi("Directory",  { fg = 110 })
hi("Title",      { fg = 188, attr = "bold" })
hi("Conceal",    { fg = 240 })
hi("NonText",    { fg = 238 })
hi("SpecialKey", { fg = 238 })
hi("MatchParen", { fg = 222, bg = 238, attr = "bold" })
hi("WildMenu",   { fg = 236, bg = 110 })

-- Syntax
hi("Comment",   { fg = 240, attr = "italic" })
hi("Constant",  { fg = 188 })
hi("String",    { fg = 144 })
hi("Character", { fg = 144 })
hi("Number",    { fg = 139 })
hi("Float",     { fg = 139 })
hi("Boolean",   { fg = 109 })

hi("Identifier", { fg = 188 })
hi("Function",   { fg = 110 })

hi("Statement",   { fg = 109 })
hi("Conditional", { fg = 109 })
hi("Repeat",      { fg = 109 })
hi("Label",       { fg = 109 })
hi("Operator",    { fg = 109 })
hi("Keyword",     { fg = 109 })
hi("Exception",   { fg = 109 })

hi("PreProc",   { fg = 109 })
hi("Include",   { fg = 109 })
hi("Define",    { fg = 109 })
hi("Macro",     { fg = 109 })
hi("PreCondit", { fg = 109 })

hi("Type",         { fg = 109 })
hi("StorageClass", { fg = 109 })
hi("Structure",    { fg = 109 })
hi("Typedef",      { fg = 109 })

hi("Special",        { fg = 188 })
hi("SpecialChar",    { fg = 222 })
hi("SpecialComment", { fg = 110, attr = "italic" })
hi("Tag",            { fg = 188 })
hi("Delimiter",      { fg = 188 })
hi("Debug",          { fg = 131 })

hi("Underlined", { fg = 110, attr = "underline" })
hi("Error",      { fg = 131 })
hi("Todo",       { fg = 222, bg = 237 })

-- Diagnostics
hi("DiagnosticError", { fg = 131 })
hi("DiagnosticWarn",  { fg = 222 })
hi("DiagnosticInfo",  { fg = 110 })
hi("DiagnosticHint",  { fg = 109 })
hi("DiagnosticOk",    { fg = 144 })

hi("DiagnosticUnderlineError", { attr = "underline" })
hi("DiagnosticUnderlineWarn",  { attr = "underline" })
hi("DiagnosticUnderlineInfo",  { attr = "underline" })
hi("DiagnosticUnderlineHint",  { attr = "underline" })

hi("DiagnosticVirtualTextError", { fg = 131, bg = 237 })
hi("DiagnosticVirtualTextWarn",  { fg = 222, bg = 237 })
hi("DiagnosticVirtualTextInfo",  { fg = 110, bg = 237 })
hi("DiagnosticVirtualTextHint",  { fg = 109, bg = 237 })

hi("DiagnosticFloatingError", { fg = 131 })
hi("DiagnosticFloatingWarn",  { fg = 222 })
hi("DiagnosticFloatingInfo",  { fg = 110 })
hi("DiagnosticFloatingHint",  { fg = 109 })

-- LSP
hi("LspReferenceRead",  { bg = 238 })
hi("LspReferenceText",  { bg = 238 })
hi("LspReferenceWrite", { bg = 238 })
hi("LspInlayHint",      { fg = 240, bg = 237 })
hi("LspSignatureActiveParameter", { fg = 222, attr = "bold" })

-- Treesitter
link("@variable", "Identifier")
link("@variable.builtin", "Keyword")
hi("@variable.parameter", { fg = 188 })
hi("@variable.member", { fg = 188 })

link("@constant", "Constant")
link("@constant.builtin", "Keyword")

link("@module", "Identifier")
link("@label", "Label")

link("@string", "String")
hi("@string.escape", { fg = 109 })
hi("@string.regexp", { fg = 222 })
link("@string.special.url", "Underlined")

link("@character", "Character")
link("@boolean", "Boolean")
link("@number", "Number")
link("@number.float", "Float")

link("@type", "Type")
hi("@type.builtin", { fg = 109 })

link("@attribute", "PreProc")
hi("@property", { fg = 188 })

link("@function", "Function")
hi("@function.builtin", { fg = 110 })
link("@function.macro", "Macro")
hi("@function.method", { fg = 110 })
hi("@function.method.call", { fg = 110 })

hi("@constructor", { fg = 109 })
link("@operator", "Operator")

link("@keyword", "Keyword")
link("@keyword.import", "Include")
link("@keyword.return", "Keyword")
link("@keyword.conditional", "Conditional")
link("@keyword.repeat", "Repeat")
link("@keyword.exception", "Exception")

hi("@punctuation.delimiter", { fg = 188 })
hi("@punctuation.bracket", { fg = 188 })
hi("@punctuation.special", { fg = 109 })

link("@comment", "Comment")
hi("@comment.error", { fg = 131 })
hi("@comment.warning", { fg = 222 })
hi("@comment.todo", { fg = 222, bg = 237 })
hi("@comment.note", { fg = 110 })

link("@markup.heading", "Title")
link("@markup.strong", "Bold")
hi("@markup.strong", { attr = "bold" })
link("@markup.italic", "Italic")
hi("@markup.italic", { attr = "italic" })
link("@markup.link.url", "Underlined")
hi("@markup.list", { fg = 109 })

link("@tag", "Tag")
hi("@tag.attribute", { fg = 110 })
hi("@tag.delimiter", { fg = 109 })

-- Git
hi("GitSignsAdd",    { fg = 144 })
hi("GitSignsChange", { fg = 222 })
hi("GitSignsDelete", { fg = 131 })

hi("diffAdded",   { fg = 144 })
hi("diffRemoved", { fg = 131 })
hi("diffChanged", { fg = 222 })
