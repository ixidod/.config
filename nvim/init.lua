vim.cmd('syntax on')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.ignorecase = true

---@class UserVimGlobals: vim.var_accessor
---@field mapleader string
---@field netrw_banner integer
---@field netrw_liststyle integer
---@field netrw_browse_split integer
---@field netrw_winsize integer
---@cast vim.g UserVimGlobals

vim.g.mapleader = ' '

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/fatih/vim-go' },
  { src = 'https://github.com/rose-pine/neovim' },
  { src = 'https://github.com/nanotee/sqls.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/tpope/vim-dadbod' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-ui' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-completion' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
require('config.theme').setup()
require('config.autopairs').setup()
require('config.telescope').setup()
require('config.treesitter').setup()
require('config.completion').setup()
require('config.netrw').setup()
require('config.dadbod').setup()
require('config.languages.lua_ls').setup()
require('config.languages.python').setup()
require('config.languages.sql').setup()
require('config.languages.go').setup()
require('config.languages.yaml').setup()
