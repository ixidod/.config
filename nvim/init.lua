vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
-- vim.cmd("colorscheme rose-pine-moon")
vim.cmd("colorscheme nord")

local opt = vim.opt
local g = vim.g

opt.termguicolors = true
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
opt.completeopt = "menu,menuone,noselect"
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1

require('lsp.kb')
require('lsp.go')
require('lsp.sql')
require('plugins.cmp')
