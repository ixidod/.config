-- Minimalist Nord colorscheme
-- For xterm-256color in GNU Screen (no GUI/termguicolors)

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "nord"
vim.o.background = "dark"
vim.o.termguicolors = false

-- 256-color palette (Nord-ish)
local c = {
  bg      = 236,   -- dark gray-blue
  bg1     = 238,   -- slightly lighter
  bg2     = 239,   -- even lighter
  fg      = 253,   -- light gray
  fgdim   = 60,    -- muted gray-blue
  none    = "NONE",
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local link = function(from, to)
  vim.api.nvim_set_hl(0, from, { link = to })
end

-- Editor
hi("Normal",       { ctermfg = c.fg, ctermbg = c.none })
hi("NormalFloat",  { ctermfg = c.fg, ctermbg = c.bg1 })
hi("FloatBorder",  { ctermfg = c.fgdim, ctermbg = c.bg1 })
hi("FloatTitle",   { ctermfg = c.fg, ctermbg = c.bg1, bold = true })
hi("Cursor",       { ctermfg = c.bg, ctermbg = c.fg })
hi("CursorLine",   { ctermbg = c.bg1 })
hi("CursorColumn", { ctermbg = c.bg1 })
hi("CursorLineNr", { ctermfg = c.fg, bold = true })
hi("LineNr",       { ctermfg = c.fgdim })
hi("SignColumn",   { ctermbg = c.none })
hi("ColorColumn",  { ctermbg = c.bg1 })
hi("VertSplit",    { ctermfg = c.bg2 })
hi("WinSeparator", { ctermfg = c.bg2 })

-- Statusline
hi("StatusLine",   { ctermfg = c.fg, ctermbg = c.bg2 })
hi("StatusLineNC", { ctermfg = c.fgdim, ctermbg = c.bg1 })

-- Tabline
hi("TabLine",     { ctermfg = c.fg, ctermbg = c.bg1 })
hi("TabLineFill", { ctermbg = c.bg1 })
hi("TabLineSel",  { ctermfg = c.fg, ctermbg = c.bg2, bold = true })

-- Pmenu
hi("Pmenu",      { ctermfg = c.fg, ctermbg = c.bg1 })
hi("PmenuSel",   { ctermfg = c.bg, ctermbg = c.fg })
hi("PmenuSbar",  { ctermbg = c.bg2 })
hi("PmenuThumb", { ctermbg = c.fg })

-- Search
hi("Search",     { ctermfg = c.bg, ctermbg = c.fg })
hi("IncSearch",  { ctermfg = c.bg, ctermbg = c.fg, bold = true })
hi("CurSearch",  { ctermfg = c.bg, ctermbg = c.fg, bold = true })
hi("Substitute", { ctermfg = c.bg, ctermbg = c.fg })

-- Visual
hi("Visual",    { ctermbg = c.bg2 })
hi("VisualNOS", { ctermbg = c.bg2 })

-- Folding
hi("Folded",     { ctermfg = c.fgdim, ctermbg = c.bg1 })
hi("FoldColumn", { ctermfg = c.fgdim })

-- Diff
hi("DiffAdd",    { ctermfg = c.fg, ctermbg = c.bg1 })
hi("DiffChange", { ctermfg = c.fg, ctermbg = c.bg1 })
hi("DiffDelete", { ctermfg = c.fgdim, ctermbg = c.bg1 })
hi("DiffText",   { ctermfg = c.fg, ctermbg = c.bg2 })

-- Messages
hi("ErrorMsg",   { ctermfg = c.fg, bold = true })
hi("WarningMsg", { ctermfg = c.fg, bold = true })
hi("ModeMsg",    { ctermfg = c.fg, bold = true })
hi("MoreMsg",    { ctermfg = c.fg })
hi("Question",   { ctermfg = c.fg })

-- Spelling (underline since no undercurl in 256-color)
hi("SpellBad",   { underline = true })
hi("SpellCap",   { underline = true })
hi("SpellLocal", { underline = true })
hi("SpellRare",  { underline = true })

-- Misc
hi("Directory",  { ctermfg = c.fg })
hi("Title",      { ctermfg = c.fg, bold = true })
hi("Conceal",    { ctermfg = c.fgdim })
hi("NonText",    { ctermfg = c.bg2 })
hi("SpecialKey", { ctermfg = c.bg2 })
hi("MatchParen", { ctermfg = c.fg, ctermbg = c.bg2, bold = true })
hi("WildMenu",   { ctermfg = c.bg, ctermbg = c.fg })

-- All syntax = same foreground (monochrome)
hi("Comment",     { ctermfg = c.fgdim, italic = true })
hi("Constant",    { ctermfg = c.fg })
hi("String",      { ctermfg = c.fgdim })
hi("Character",   { ctermfg = c.fg })
hi("Number",      { ctermfg = c.fg })
hi("Float",       { ctermfg = c.fg })
hi("Boolean",     { ctermfg = c.fg })
hi("Identifier",  { ctermfg = c.fg })
hi("Function",    { ctermfg = c.fg })
hi("Statement",   { ctermfg = c.fg })
hi("Conditional", { ctermfg = c.fg })
hi("Repeat",      { ctermfg = c.fg })
hi("Label",       { ctermfg = c.fg })
hi("Operator",    { ctermfg = c.fg })
hi("Keyword",     { ctermfg = c.fg })
hi("Exception",   { ctermfg = c.fg })
hi("PreProc",     { ctermfg = c.fg })
hi("Include",     { ctermfg = c.fg })
hi("Define",      { ctermfg = c.fg })
hi("Macro",       { ctermfg = c.fg })
hi("PreCondit",   { ctermfg = c.fg })
hi("Type",        { ctermfg = c.fg })
hi("StorageClass",{ ctermfg = c.fg })
hi("Structure",   { ctermfg = c.fg })
hi("Typedef",     { ctermfg = c.fg })
hi("Special",     { ctermfg = c.fg })
hi("SpecialChar", { ctermfg = c.fg })
hi("Tag",         { ctermfg = c.fg })
hi("Delimiter",   { ctermfg = c.fg })
hi("Debug",       { ctermfg = c.fg })
hi("Underlined",  { ctermfg = c.fg, underline = true })
hi("Error",       { ctermfg = c.fg, underline = true })
hi("Todo",        { ctermfg = c.fg, bold = true })
hi("SpecialComment", { ctermfg = c.fgdim })

-- Diagnostics (subtle)
hi("DiagnosticError", { ctermfg = c.fg })
hi("DiagnosticWarn",  { ctermfg = c.fg })
hi("DiagnosticInfo",  { ctermfg = c.fgdim })
hi("DiagnosticHint",  { ctermfg = c.fgdim })
hi("DiagnosticOk",    { ctermfg = c.fg })

hi("DiagnosticUnderlineError", { underline = true })
hi("DiagnosticUnderlineWarn",  { underline = true })
hi("DiagnosticUnderlineInfo",  { underline = true })
hi("DiagnosticUnderlineHint",  { underline = true })

hi("DiagnosticVirtualTextError", { ctermfg = c.fgdim })
hi("DiagnosticVirtualTextWarn",  { ctermfg = c.fgdim })
hi("DiagnosticVirtualTextInfo",  { ctermfg = c.fgdim })
hi("DiagnosticVirtualTextHint",  { ctermfg = c.fgdim })

-- LSP
hi("LspReferenceRead",  { ctermbg = c.bg2 })
hi("LspReferenceText",  { ctermbg = c.bg2 })
hi("LspReferenceWrite", { ctermbg = c.bg2 })
hi("LspInlayHint",      { ctermfg = c.fgdim })

-- Treesitter - all monochrome
link("@variable", "Identifier")
link("@variable.builtin", "Identifier")
link("@variable.parameter", "Identifier")
link("@variable.member", "Identifier")
link("@constant", "Constant")
link("@constant.builtin", "Constant")
link("@module", "Identifier")
link("@label", "Label")
link("@string", "String")
link("@string.escape", "String")
link("@string.regexp", "String")
link("@string.special.url", "Underlined")
link("@character", "Character")
link("@boolean", "Boolean")
link("@number", "Number")
link("@number.float", "Float")
link("@type", "Type")
link("@type.builtin", "Type")
link("@attribute", "PreProc")
link("@property", "Identifier")
link("@function", "Function")
link("@function.builtin", "Function")
link("@function.macro", "Macro")
link("@function.method", "Function")
link("@constructor", "Function")
link("@operator", "Operator")
link("@keyword", "Keyword")
link("@keyword.import", "Include")
link("@keyword.return", "Keyword")
link("@keyword.conditional", "Conditional")
link("@keyword.repeat", "Repeat")
link("@keyword.exception", "Exception")
link("@punctuation.delimiter", "Delimiter")
link("@punctuation.bracket", "Delimiter")
link("@punctuation.special", "Delimiter")
link("@comment", "Comment")
link("@comment.error", "Comment")
link("@comment.warning", "Comment")
link("@comment.todo", "Todo")
link("@comment.note", "Comment")
link("@markup.heading", "Title")
hi("@markup.strong", { ctermfg = c.fg, bold = true })
hi("@markup.italic", { ctermfg = c.fg, italic = true })
link("@markup.link.url", "Underlined")
link("@tag", "Tag")
link("@tag.attribute", "Identifier")
link("@tag.delimiter", "Delimiter")

-- Git
hi("GitSignsAdd",    { ctermfg = c.fg })
hi("GitSignsChange", { ctermfg = c.fgdim })
hi("GitSignsDelete", { ctermfg = c.fgdim })
hi("diffAdded",   { ctermfg = c.fg })
hi("diffRemoved", { ctermfg = c.fgdim })
hi("diffChanged", { ctermfg = c.fg })

-- LSP semantic tokens - all monochrome
link("@lsp.type.comment", "Comment")
link("@lsp.type.keyword", "Keyword")
link("@lsp.type.string", "String")
link("@lsp.type.number", "Number")
link("@lsp.type.function", "Function")
link("@lsp.type.variable", "Identifier")
link("@lsp.type.type", "Type")
link("@lsp.type.class", "Type")
link("@lsp.type.interface", "Type")
link("@lsp.type.enum", "Type")
link("@lsp.type.struct", "Type")
link("@lsp.type.property", "Identifier")
link("@lsp.type.method", "Function")
link("@lsp.type.parameter", "Identifier")
link("@lsp.type.decorator", "Identifier")
link("@lsp.type.namespace", "Identifier")
