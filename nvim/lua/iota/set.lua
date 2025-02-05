vim.cmd('colorscheme rose-pine')
vim.o.laststatus = 3
vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true
vim.o.scrolloff = 50
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.timeoutlen = 3000

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.go_template_autocreate = 0

vim.opt.clipboard:append("unnamedplus")


