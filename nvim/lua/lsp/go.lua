vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.lsp.buf.format()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    vim.fn.winrestview(view)
  end,
})

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  cmd_env = {
    GOMEMLIMIT = '2GiB',
  },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  init_options = {
    semanticTokens = true,
  },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = false,
      directoryFilters = { '-vendor', '-docs', '-examples', '-nix', '-loki-build-image' },
    },
  },
})

vim.lsp.enable('gopls')
