vim.cmd("colorscheme nord")

local opt = vim.opt
local g = vim.g

opt.shortmess:append("I")
opt.fillchars = { eob = " " }
opt.modelines = 0
opt.timeoutlen = 4000  
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.numberwidth = 3
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.wrap = false
opt.pumheight = 15
opt.completeopt = "menuone,noselect,popup"
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
g.mapleader = " "

g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_winsize = 25
g.netrw_altv = 1
g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+]]

require('lsp.kb')
require('lsp.go')
require('lsp.terraform')
