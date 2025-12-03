local api = vim.api

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.o.termguicolors = false
vim.g.colors_name = "ixidod_min"

local function hi(group, opts)
	api.nvim_set_hl(0, group, opts or {})
end

-- core UI
hi("Normal", {})
hi("NormalFloat", {})
hi("SignColumn", {})
hi("LineNr", {})
hi("CursorLineNr", {})
hi("EndOfBuffer", {})

-- statusline / tabline / separators
hi("StatusLine", {
	fg = "Black",
	bg = "White",
	ctermfg = 0,
	ctermbg = 15,
})
hi("StatusLineNC", {
	fg = "White",
	bg = "Black",
	ctermfg = 15,
	ctermbg = 0,
})
hi("TabLine", {})
hi("TabLineFill", {})
hi("TabLineSel", {})
hi("WinSeparator", {})
hi("VertSplit", {})

-- message areas
hi("ModeMsg", {})
hi("MsgArea", {})
hi("MsgSeparator", {})

-- selections / matches
hi("Visual", { reverse = true })
hi("Search", { reverse = true })
hi("IncSearch", { reverse = true })
hi("MatchParen", { underline = true })

-- syntax groups forced to Normal
local syntax_groups = {
	"Comment",
	"Constant",
	"String",
	"Character",
	"Number",
	"Boolean",
	"Float",
	"Identifier",
	"Function",
	"Statement",
	"Conditional",
	"Repeat",
	"Label",
	"Operator",
	"Keyword",
	"Exception",
	"PreProc",
	"Include",
	"Define",
	"Macro",
	"PreCondit",
	"Type",
	"StorageClass",
	"Structure",
	"Typedef",
	"Special",
	"SpecialChar",
	"Tag",
	"Delimiter",
	"SpecialComment",
	"Debug",
}

for _, grp in ipairs(syntax_groups) do
	hi(grp, { link = "Normal" })
end
