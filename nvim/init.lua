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
opt.completeopt = "menuone,noselect"

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

-- LSP float window borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  max_width = 80,
  wrap = true,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  max_width = 80,
  wrap = true,
})
vim.diagnostic.config({
  float = { border = "rounded" },
})

-- LSP
vim.lsp.enable("go")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local opts = { buffer = bufnr }

    -- Enable completion
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "K", vim.lsp.buf.hover, opts)

    -- Actions
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Diagnostics
    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "]d", vim.diagnostic.goto_next, opts)
    map("n", "gl", vim.diagnostic.open_float, opts)
    map("n", "<leader>dl", vim.diagnostic.setloclist, opts)
  end,
})

-- Format Go files with goimports on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})
