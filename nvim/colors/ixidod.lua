local p = {
  base = "#191724",
  surface = "#1f1d2e",
  overlay = "#26233a",
  muted = "#6e6a86",
  subtle = "#908caa",
  text = "#e0def4",
  love = "#eb6f92",
  gold = "#f6c177",
  rose = "#ebbcba",
  pine = "#31748f",
  foam = "#9ccfd8",
  iris = "#c4a7e7",
}

-- 256-color fallbacks for screen/terminals without true color
local c = {
  base = 234,      -- dark bg
  surface = 235,   -- slightly lighter bg
  overlay = 236,   -- overlay bg
  muted = 60,      -- muted gray
  subtle = 103,    -- subtle gray
  text = 189,      -- light text
  love = 204,      -- pink/red
  gold = 215,      -- gold/yellow
  rose = 181,      -- rose/pink
  pine = 66,       -- teal/cyan
  foam = 152,      -- light cyan
  iris = 183,      -- purple
}

vim.cmd("highlight clear")

-- Detect if we're in screen - disable true colors if so
local term = vim.env.TERM or ""
if term:match("screen") then
  vim.o.termguicolors = false
else
  vim.o.termguicolors = true
end

vim.g.colors_name = "ixidod"

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal", { fg = p.text, bg = p.base, ctermfg = c.text, ctermbg = c.base })
hi("NormalFloat", { fg = p.text, bg = p.surface, ctermfg = c.text, ctermbg = c.surface })
hi("Comment", { fg = p.muted, italic = true, ctermfg = c.muted })
hi("Constant", { fg = p.rose, ctermfg = c.rose })
hi("String", { fg = p.gold, ctermfg = c.gold })
hi("Identifier", { fg = p.foam, ctermfg = c.foam })
hi("Statement", { fg = p.iris, ctermfg = c.iris })
hi("PreProc", { fg = p.gold, ctermfg = c.gold })
hi("Type", { fg = p.pine, ctermfg = c.pine })
hi("Special", { fg = p.love, ctermfg = c.love })
hi("Error", { fg = p.love, ctermfg = c.love })
hi("Todo", { fg = p.gold, bg = p.overlay, ctermfg = c.gold, ctermbg = c.overlay })
hi("CursorLine", { bg = p.surface, ctermbg = c.surface })
hi("CursorLineNr", { fg = p.rose, ctermfg = c.rose })
hi("LineNr", { fg = p.muted, ctermfg = c.muted })
hi("Visual", { bg = p.overlay, ctermbg = c.overlay })
hi("Search", { fg = p.base, bg = p.gold, ctermfg = c.base, ctermbg = c.gold })
hi("IncSearch", { fg = p.base, bg = p.rose, ctermfg = c.base, ctermbg = c.rose })

-- LSP
hi("DiagnosticError", { fg = p.love, ctermfg = c.love })
hi("DiagnosticWarn", { fg = p.gold, ctermfg = c.gold })
hi("DiagnosticInfo", { fg = p.foam, ctermfg = c.foam })
hi("DiagnosticHint", { fg = p.iris, ctermfg = c.iris })

hi("DiagnosticUnderlineError", { sp = p.love, underline = true, ctermfg = c.love })
hi("DiagnosticUnderlineWarn", { sp = p.gold, underline = true, ctermfg = c.gold })
hi("DiagnosticUnderlineInfo", { sp = p.foam, underline = true, ctermfg = c.foam })
hi("DiagnosticUnderlineHint", { sp = p.iris, underline = true, ctermfg = c.iris })

-- TreeSitter
hi("@variable", { fg = p.text, ctermfg = c.text })
hi("@variable.builtin", { fg = p.love, ctermfg = c.love })
hi("@variable.parameter", { fg = p.iris, ctermfg = c.iris })
hi("@variable.member", { fg = p.foam, ctermfg = c.foam })

hi("@constant", { fg = p.rose, ctermfg = c.rose })
hi("@constant.builtin", { fg = p.rose, ctermfg = c.rose })
hi("@constant.macro", { fg = p.rose, ctermfg = c.rose })

hi("@string", { fg = p.gold, ctermfg = c.gold })
hi("@string.escape", { fg = p.pine, ctermfg = c.pine })
hi("@string.special", { fg = p.rose, ctermfg = c.rose })

hi("@character", { fg = p.gold, ctermfg = c.gold })
hi("@number", { fg = p.rose, ctermfg = c.rose })
hi("@boolean", { fg = p.rose, ctermfg = c.rose })
hi("@float", { fg = p.rose, ctermfg = c.rose })

hi("@function", { fg = p.foam, ctermfg = c.foam })
hi("@function.builtin", { fg = p.love, ctermfg = c.love })
hi("@function.macro", { fg = p.foam, ctermfg = c.foam })
hi("@function.method", { fg = p.foam, ctermfg = c.foam })

hi("@constructor", { fg = p.foam, ctermfg = c.foam })
hi("@keyword", { fg = p.iris, ctermfg = c.iris })
hi("@keyword.function", { fg = p.iris, ctermfg = c.iris })
hi("@keyword.operator", { fg = p.iris, ctermfg = c.iris })
hi("@keyword.return", { fg = p.iris, ctermfg = c.iris })
hi("@keyword.conditional", { fg = p.iris, ctermfg = c.iris })
hi("@keyword.repeat", { fg = p.iris, ctermfg = c.iris })

hi("@operator", { fg = p.subtle, ctermfg = c.subtle })
hi("@punctuation.delimiter", { fg = p.subtle, ctermfg = c.subtle })
hi("@punctuation.bracket", { fg = p.subtle, ctermfg = c.subtle })
hi("@punctuation.special", { fg = p.love, ctermfg = c.love })

hi("@type", { fg = p.pine, ctermfg = c.pine })
hi("@type.builtin", { fg = p.pine, ctermfg = c.pine })
hi("@type.qualifier", { fg = p.iris, ctermfg = c.iris })

hi("@property", { fg = p.foam, ctermfg = c.foam })
hi("@field", { fg = p.foam, ctermfg = c.foam })

hi("@comment", { fg = p.muted, italic = true, ctermfg = c.muted })
hi("@comment.error", { fg = p.love, ctermfg = c.love })
hi("@comment.warning", { fg = p.gold, ctermfg = c.gold })
hi("@comment.todo", { fg = p.gold, ctermfg = c.gold })
hi("@comment.note", { fg = p.foam, ctermfg = c.foam })

hi("@tag", { fg = p.iris, ctermfg = c.iris })
hi("@tag.attribute", { fg = p.foam, ctermfg = c.foam })
hi("@tag.delimiter", { fg = p.subtle, ctermfg = c.subtle })
