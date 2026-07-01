vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    local view = vim.fn.winsaveview()
    vim.lsp.buf.format()
    vim.fn.winrestview(view)
  end,
})

vim.lsp.config('terraformls', {
  cmd = { 'terraform-ls', 'serve' },
  filetypes = { 'terraform', 'terraform-vars' },
  root_markers = { '.terraform', '.git' },
})

vim.lsp.enable('terraformls')
