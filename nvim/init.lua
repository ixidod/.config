vim.cmd('syntax on')

vim.opt.hlsearch = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.autoindent = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.ignorecase = true
vim.cmd.filetype("plugin indent on")


vim.g.mapleader = ' '

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

