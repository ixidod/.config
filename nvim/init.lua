vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('colorscheme rose-pine')

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
opt.cursorline       = true
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

--------------------------------------------------------
-- Keymaps
--------------------------------------------------------

local map            = vim.keymap.set
local kopt           = { noremap = true, silent = true }

-- Clear search highlight
map('n', '<leader>h', ':nohlsearch<CR>', kopt)

-- Netrw in current directory
map('n', '<leader>e', ':Ex<CR>', kopt)

-- Window navigation
map('n', '<C-h>', '<C-w>h', kopt)
map('n', '<C-j>', '<C-w>j', kopt)
map('n', '<C-k>', '<C-w>k', kopt)
map('n', '<C-l>', '<C-w>l', kopt)

-- Keep selection when indenting in visual mode
map('v', '<', '<gv', kopt)
map('v', '>', '>gv', kopt)

-- Completion trigger: Ctrl-Space
map('i', '<C-Space>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<C-x><C-o>'
end, { expr = true })

--------------------------------------------------------
-- Diagnostics keymaps (built-in)
--------------------------------------------------------

map('n', '[d', vim.diagnostic.goto_prev, kopt)
map('n', ']d', vim.diagnostic.goto_next, kopt)
map('n', '<leader>d', vim.diagnostic.open_float, kopt)
map('n', '<leader>ld', vim.diagnostic.setloclist, kopt)

--------------------------------------------------------
-- LSP core
--------------------------------------------------------

local lsp = vim.lsp

local function on_attach(client, bufnr)
  local bufopts = { buffer = bufnr, silent = true, noremap = true }

  vim.keymap.set('n', 'gd', lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', lsp.buf.references, bufopts)

  vim.keymap.set('n', 'K', lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>rn', lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', lsp.buf.code_action, bufopts)

  vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
    lsp.buf.format({ async = true })
  end, bufopts)
end

-- global LSP defaults
vim.lsp.config('*', {
  on_attach = on_attach,
})

local root = vim.fs.root

-- Python (pyright)
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.cfg', 'setup.py', 'requirements.txt', '.git' },
})

-- YAML
vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yml' },
  root_markers = { '.git', '.yamlls.json', 'yaml.config.json' },
  settings = {
    yaml = {
      format = {
        enable = true,
        singleQuote = true,
        printWidth = 80,
      },
      validate = true,
      hover = true,
      completion = true,
    },
  },
})

-- SQL
vim.lsp.config('sqls', {
  cmd = { 'sqls' },
  filetypes = { 'sql' },
  root_markers = { 'sqls.yml', '.git' },
})

-- Lua (lua-language-server)
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json', '.luarc.jsonc', '.git',
  },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
      format = { enable = true },
    },
  },
})

vim.lsp.enable({ 'pyright', 'yamlls', 'sqls', 'lua_ls' })
