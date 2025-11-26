vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('colorscheme ixidod_min')

local opt            = vim.opt
local g              = vim.g

opt.hlsearch         = false
opt.incsearch        = true
opt.ignorecase       = true
opt.smartcase        = true
opt.undofile         = true
opt.undodir          = vim.fn.stdpath('data') .. '/undo'

opt.swapfile         = false
opt.backup           = false
opt.writebackup      = false

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

map('n', '<leader>w', ':write<CR>', kopt)
map('n', '<leader>q', ':quit<CR>', kopt)

map('n', '<leader>h', ':nohlsearch<CR>', kopt)

map('n', '<leader>e', ':Ex<CR>', kopt)

map('n', '<C-h>', '<C-w>h', kopt)
map('n', '<C-j>', '<C-w>j', kopt)
map('n', '<C-k>', '<C-w>k', kopt)
map('n', '<C-l>', '<C-w>l', kopt)

map('v', '<', '<gv', kopt)
map('v', '>', '>gv', kopt)

map('i', '<C-Space>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<C-x><C-o>'
end, { expr = true })

map('n', '[d', vim.diagnostic.goto_prev, kopt)
map('n', ']d', vim.diagnostic.goto_next, kopt)
map('n', '<leader>d', vim.diagnostic.open_float, kopt)
map('n', '<leader>ld', vim.diagnostic.setloclist, kopt)

local function on_attach(client, bufnr)
  local map = vim.keymap.set
  local lsp = vim.lsp
  local opt = { buffer = bufnr, silent = true, noremap = true }

  map('n', 'gd', lsp.buf.definition, opt)
  map('n', 'gD', lsp.buf.declaration, opt)
  map('n', 'gi', lsp.buf.implementation, opt)
  map('n', 'gr', lsp.buf.references, opt)

  map('n', 'K', lsp.buf.hover, opt)
  map('n', '<leader>rn', lsp.buf.rename, opt)
  map('n', '<leader>ca', lsp.buf.code_action, opt)

  map({ 'n', 'v' }, '<leader>f', function()
    lsp.buf.format({ async = true })
  end, opt)
end

vim.lsp.config("*", {
  on_attach    = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.lsp.config("pyright", {
  cmd          = { "pyright-langserver", "--stdio" },
  filetypes    = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.cfg",
    "setup.py",
    "requirements.txt",
    ".git",
  },
})

vim.lsp.config("yamlls", {
  cmd          = { "yaml-language-server", "--stdio" },
  filetypes    = { "yaml", "yml" },
  root_markers = { ".yamlls.json", "yaml.config.json", ".git" },
  settings     = {
    yaml = {
      format     = { enable = true, singleQuote = true, printWidth = 80 },
      validate   = true,
      hover      = true,
      completion = true,
    },
  },
})

vim.lsp.config("sqls", {
  cmd          = { "sqls" },
  filetypes    = { "sql" },
  root_markers = { "sqls.yml", ".git" },
})

vim.lsp.enable({
  "pyright",
  "yamlls",
  "sqls",
})
