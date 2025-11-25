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
vim.g.colors_name = "rose-pine"

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
