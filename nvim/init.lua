vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme nord")

local opt = vim.opt
local g = vim.g

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
opt.completeopt = "menuone,noselect,fuzzy"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

g.mapleader = " "

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1

local map = vim.keymap.set
local kopt = { noremap = true, silent = true }

map("n", "<leader>bn", ":bnext<CR>", kopt)
map("n", "<leader>bp", ":bprevious<CR>", kopt)
map("n", "<leader>bd", ":bd<CR>", kopt)
map("n", "<leader>bb", ":b#<CR>", kopt)
map("n", "<leader>bl", ":ls<CR>", kopt)

map("n", "<leader>w", ":write<CR>", kopt)
map("n", "<leader>q", ":quit<CR>", kopt)

map("n", "<C-h>", "<C-w>h", kopt)
map("n", "<C-j>", "<C-w>j", kopt)
map("n", "<C-k>", "<C-w>k", kopt)
map("n", "<C-l>", "<C-w>l", kopt)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd("%!goimports")
    vim.fn.winrestview(view)
  end,
})
