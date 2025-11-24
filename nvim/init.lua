vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.lsp.enable('pyright')
vim.lsp.enable('sqls')
