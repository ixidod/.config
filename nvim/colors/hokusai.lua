-- Hokusai - A NeoVim dark colorscheme inspired by "The Great Wave off Kanagawa"
-- Color palette derived from Katsushika Hokusai's famous ukiyo-e woodblock print

local p = {
  -- Deep ocean and sky
  wave_deep = "#0a1f44",      -- Deep prussian blue (darkest bg)
  wave_base = "#1a3a5f",      -- Prussian blue (main bg)
  wave_surf = "#2d4f7c",      -- Medium blue (surface)

  -- Wave foam and highlights
  foam = "#9ccfd8",           -- Cyan foam
  foam_light = "#c8e0e8",     -- Light foam/spray
  foam_bright = "#e8f4f8",    -- Brightest foam (main text)

  -- Mount Fuji and warm accents
  fuji = "#e8d5b7",           -- Beige/cream (secondary text)
  fuji_peak = "#f4e8d0",      -- Light cream
  sunrise = "#f6c177",        -- Warm golden yellow

  -- Accent colors from the print
  indigo = "#4169a8",         -- Wave indigo
  sky_blue = "#6b9ac4",       -- Sky blue
  teal = "#2a9d8f",           -- Deep teal
  coral = "#eb8f82",          -- Coral (errors/warnings)

  -- Grays
  muted = "#5a7a99",          -- Muted blue-gray
  subtle = "#7a96b3",         -- Subtle blue-gray
}

-- ANSI 16-color fallbacks for maximum compatibility (screen/macOS Terminal)
-- Colors 0-15: Black, Red, Green, Yellow, Blue, Magenta, Cyan, White
--              and their bright variants (8-15)
local c = {
  wave_deep = 0,      -- Black
  wave_base = 0,      -- Black
  wave_surf = 8,      -- BrightBlack (Gray)
  foam = 14,          -- BrightCyan
  foam_light = 15,    -- BrightWhite
  foam_bright = 15,   -- BrightWhite
  fuji = 7,           -- White
  fuji_peak = 15,     -- BrightWhite
  sunrise = 11,       -- BrightYellow
  indigo = 12,        -- BrightBlue
  sky_blue = 14,      -- BrightCyan
  teal = 6,           -- Cyan
  coral = 9,          -- BrightRed
  muted = 8,          -- BrightBlack (Gray)
  subtle = 8,         -- BrightBlack (Gray)
}

vim.cmd("highlight clear")

-- Force ANSI 16-color mode for maximum compatibility
-- This ensures the color scheme works in all environments (screen, tmux, macOS Terminal, etc.)
vim.o.termguicolors = false

vim.g.colors_name = "hokusai"

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Base UI
hi("Normal", { fg = p.foam_bright, bg = p.wave_base, ctermfg = c.foam_bright, ctermbg = c.wave_base })
hi("NormalFloat", { fg = p.foam_bright, bg = p.wave_surf, ctermfg = c.foam_bright, ctermbg = c.wave_surf })
hi("Comment", { fg = p.muted, italic = true, ctermfg = c.muted })

-- Syntax
hi("Constant", { fg = p.fuji, ctermfg = c.fuji })
hi("String", { fg = p.sunrise, ctermfg = c.sunrise })
hi("Identifier", { fg = p.foam, ctermfg = c.foam })
hi("Statement", { fg = p.indigo, ctermfg = c.indigo })
hi("PreProc", { fg = p.sky_blue, ctermfg = c.sky_blue })
hi("Type", { fg = p.teal, ctermfg = c.teal })
hi("Special", { fg = p.foam_light, ctermfg = c.foam_light })
hi("Error", { fg = p.coral, ctermfg = c.coral })
hi("Todo", { fg = p.sunrise, bg = p.wave_surf, bold = true, ctermfg = c.sunrise, ctermbg = c.wave_surf })

-- UI Elements
hi("CursorLine", { bg = p.wave_surf, ctermbg = c.wave_surf })
hi("CursorLineNr", { fg = p.foam, bold = true, ctermfg = c.foam })
hi("LineNr", { fg = p.muted, ctermfg = c.muted })
hi("Visual", { bg = "#265070", ctermbg = 239 })
hi("Search", { fg = p.wave_deep, bg = p.sunrise, ctermfg = c.wave_deep, ctermbg = c.sunrise })
hi("IncSearch", { fg = p.wave_deep, bg = p.foam, ctermfg = c.wave_deep, ctermbg = c.foam })
hi("StatusLine", { fg = p.foam_bright, bg = p.wave_surf, ctermfg = c.foam_bright, ctermbg = c.wave_surf })
hi("StatusLineNC", { fg = p.muted, bg = p.wave_deep, ctermfg = c.muted, ctermbg = c.wave_deep })
hi("Pmenu", { fg = p.foam_bright, bg = p.wave_surf, ctermfg = c.foam_bright, ctermbg = c.wave_surf })
hi("PmenuSel", { fg = p.wave_deep, bg = p.foam, ctermfg = c.wave_deep, ctermbg = c.foam })

-- LSP
hi("DiagnosticError", { fg = p.coral, ctermfg = c.coral })
hi("DiagnosticWarn", { fg = p.sunrise, ctermfg = c.sunrise })
hi("DiagnosticInfo", { fg = p.foam, ctermfg = c.foam })
hi("DiagnosticHint", { fg = p.sky_blue, ctermfg = c.sky_blue })

hi("DiagnosticUnderlineError", { sp = p.coral, underline = true, ctermfg = c.coral })
hi("DiagnosticUnderlineWarn", { sp = p.sunrise, underline = true, ctermfg = c.sunrise })
hi("DiagnosticUnderlineInfo", { sp = p.foam, underline = true, ctermfg = c.foam })
hi("DiagnosticUnderlineHint", { sp = p.sky_blue, underline = true, ctermfg = c.sky_blue })

-- TreeSitter
hi("@variable", { fg = p.foam_bright, ctermfg = c.foam_bright })
hi("@variable.builtin", { fg = p.coral, ctermfg = c.coral })
hi("@variable.parameter", { fg = p.indigo, ctermfg = c.indigo })
hi("@variable.member", { fg = p.foam, ctermfg = c.foam })

hi("@constant", { fg = p.fuji, ctermfg = c.fuji })
hi("@constant.builtin", { fg = p.fuji_peak, ctermfg = c.fuji_peak })
hi("@constant.macro", { fg = p.fuji, ctermfg = c.fuji })

hi("@string", { fg = p.sunrise, ctermfg = c.sunrise })
hi("@string.escape", { fg = p.teal, ctermfg = c.teal })
hi("@string.special", { fg = p.fuji_peak, ctermfg = c.fuji_peak })

hi("@character", { fg = p.sunrise, ctermfg = c.sunrise })
hi("@number", { fg = p.fuji, ctermfg = c.fuji })
hi("@boolean", { fg = p.fuji, ctermfg = c.fuji })
hi("@float", { fg = p.fuji, ctermfg = c.fuji })

hi("@function", { fg = p.foam, ctermfg = c.foam })
hi("@function.builtin", { fg = p.foam_light, ctermfg = c.foam_light })
hi("@function.macro", { fg = p.sky_blue, ctermfg = c.sky_blue })
hi("@function.method", { fg = p.foam, ctermfg = c.foam })

hi("@constructor", { fg = p.teal, ctermfg = c.teal })
hi("@keyword", { fg = p.indigo, bold = true, ctermfg = c.indigo })
hi("@keyword.function", { fg = p.indigo, ctermfg = c.indigo })
hi("@keyword.operator", { fg = p.indigo, ctermfg = c.indigo })
hi("@keyword.return", { fg = p.indigo, bold = true, ctermfg = c.indigo })
hi("@keyword.conditional", { fg = p.indigo, ctermfg = c.indigo })
hi("@keyword.repeat", { fg = p.indigo, ctermfg = c.indigo })

hi("@operator", { fg = p.subtle, ctermfg = c.subtle })
hi("@punctuation.delimiter", { fg = p.subtle, ctermfg = c.subtle })
hi("@punctuation.bracket", { fg = p.subtle, ctermfg = c.subtle })
hi("@punctuation.special", { fg = p.foam_light, ctermfg = c.foam_light })

hi("@type", { fg = p.teal, ctermfg = c.teal })
hi("@type.builtin", { fg = p.teal, ctermfg = c.teal })
hi("@type.qualifier", { fg = p.indigo, ctermfg = c.indigo })

hi("@property", { fg = p.foam, ctermfg = c.foam })
hi("@field", { fg = p.foam, ctermfg = c.foam })

hi("@comment", { fg = p.muted, italic = true, ctermfg = c.muted })
hi("@comment.error", { fg = p.coral, ctermfg = c.coral })
hi("@comment.warning", { fg = p.sunrise, ctermfg = c.sunrise })
hi("@comment.todo", { fg = p.sunrise, bold = true, ctermfg = c.sunrise })
hi("@comment.note", { fg = p.foam, ctermfg = c.foam })

hi("@tag", { fg = p.indigo, ctermfg = c.indigo })
hi("@tag.attribute", { fg = p.foam, ctermfg = c.foam })
hi("@tag.delimiter", { fg = p.subtle, ctermfg = c.subtle })

-- Git
hi("DiffAdd", { fg = p.teal, bg = p.wave_surf, ctermfg = c.teal, ctermbg = c.wave_surf })
hi("DiffChange", { fg = p.sunrise, bg = p.wave_surf, ctermfg = c.sunrise, ctermbg = c.wave_surf })
hi("DiffDelete", { fg = p.coral, bg = p.wave_surf, ctermfg = c.coral, ctermbg = c.wave_surf })
hi("DiffText", { fg = p.foam_bright, bg = p.wave_deep, bold = true, ctermfg = c.foam_bright, ctermbg = c.wave_deep })
