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

vim.cmd("highlight clear")
vim.o.termguicolors = true
vim.g.colors_name = "ixidod"

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal", { fg = p.text, bg = p.base })
hi("NormalFloat", { fg = p.text, bg = p.surface })
hi("Comment", { fg = p.muted, italic = true })
hi("Constant", { fg = p.rose })
hi("String", { fg = p.gold })
hi("Identifier", { fg = p.foam })
hi("Statement", { fg = p.iris })
hi("PreProc", { fg = p.gold })
hi("Type", { fg = p.pine })
hi("Special", { fg = p.love })
hi("Error", { fg = p.love })
hi("Todo", { fg = p.gold, bg = p.overlay })
hi("CursorLine", { bg = p.surface })
hi("CursorLineNr", { fg = p.rose })
hi("LineNr", { fg = p.muted })
hi("Visual", { bg = p.overlay })
hi("Search", { fg = p.base, bg = p.gold })
hi("IncSearch", { fg = p.base, bg = p.rose })

-- LSP
hi("DiagnosticError", { fg = p.love })
hi("DiagnosticWarn", { fg = p.gold })
hi("DiagnosticInfo", { fg = p.foam })
hi("DiagnosticHint", { fg = p.iris })

hi("DiagnosticUnderlineError", { sp = p.love, underline = true })
hi("DiagnosticUnderlineWarn", { sp = p.gold, underline = true })
hi("DiagnosticUnderlineInfo", { sp = p.foam, underline = true })
hi("DiagnosticUnderlineHint", { sp = p.iris, underline = true })

-- TreeSitter
hi("@variable", { fg = p.text })
hi("@variable.builtin", { fg = p.love })
hi("@variable.parameter", { fg = p.iris })
hi("@variable.member", { fg = p.foam })

hi("@constant", { fg = p.rose })
hi("@constant.builtin", { fg = p.rose })
hi("@constant.macro", { fg = p.rose })

hi("@string", { fg = p.gold })
hi("@string.escape", { fg = p.pine })
hi("@string.special", { fg = p.rose })

hi("@character", { fg = p.gold })
hi("@number", { fg = p.rose })
hi("@boolean", { fg = p.rose })
hi("@float", { fg = p.rose })

hi("@function", { fg = p.foam })
hi("@function.builtin", { fg = p.love })
hi("@function.macro", { fg = p.foam })
hi("@function.method", { fg = p.foam })

hi("@constructor", { fg = p.foam })
hi("@keyword", { fg = p.iris })
hi("@keyword.function", { fg = p.iris })
hi("@keyword.operator", { fg = p.iris })
hi("@keyword.return", { fg = p.iris })
hi("@keyword.conditional", { fg = p.iris })
hi("@keyword.repeat", { fg = p.iris })

hi("@operator", { fg = p.subtle })
hi("@punctuation.delimiter", { fg = p.subtle })
hi("@punctuation.bracket", { fg = p.subtle })
hi("@punctuation.special", { fg = p.love })

hi("@type", { fg = p.pine })
hi("@type.builtin", { fg = p.pine })
hi("@type.qualifier", { fg = p.iris })

hi("@property", { fg = p.foam })
hi("@field", { fg = p.foam })

hi("@comment", { fg = p.muted, italic = true })
hi("@comment.error", { fg = p.love })
hi("@comment.warning", { fg = p.gold })
hi("@comment.todo", { fg = p.gold })
hi("@comment.note", { fg = p.foam })

hi("@tag", { fg = p.iris })
hi("@tag.attribute", { fg = p.foam })
hi("@tag.delimiter", { fg = p.subtle })
