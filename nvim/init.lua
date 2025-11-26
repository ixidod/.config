vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('colorscheme ixidod_min')

vim.api.nvim_set_hl(0, "Directory", { link = "Normal" })

local opt            = vim.opt
local g              = vim.g

opt.modelines = 0

opt.hlsearch         = false
opt.incsearch        = true
opt.ignorecase       = true
opt.smartcase        = true
opt.undofile         = true
opt.undodir          = vim.fn.stdpath('data') .. '/undo'

opt.swapfile         = false
opt.backup           = false
opt.writebackup      = false

opt.numberwidth = 3
opt.number           = true
opt.relativenumber   = true
opt.signcolumn       = 'yes'

opt.scrolloff        = 8
opt.wrap             = false

opt.tabstop          = 2
opt.softtabstop      = 2
opt.shiftwidth       = 2
opt.expandtab        = true
opt.smartindent      = true

opt.completeopt      = { 'menuone', 'noselect' }
opt.updatetime       = 250
opt.termguicolors    = true

g.mapleader          = ' '

g.netrw_banner       = 0
g.netrw_liststyle    = 3
g.netrw_browse_split = 0
g.netrw_winsize      = 25

local map            = vim.keymap.set
local kopt           = { noremap = true, silent = true }

map('n', '<leader>bn', ':bnext<CR>', kopt)
map('n', '<leader>bp', ':bprevious<CR>', kopt)

map('n', '<leader>w', ':write<CR>', kopt)
map('n', '<leader>q', ':quit<CR>', kopt)
map('n', '<leader>h', ':nohlsearch<CR>', kopt)
map('n', '<leader>e', ':Ex<CR>', kopt)

map('n', '<C-h>', '<C-w>h', kopt)
map('n', '<C-j>', '<C-w>j', kopt)
map('n', '<C-k>', '<C-w>k', kopt)
map('n', '<C-l>', '<C-w>l', kopt)
