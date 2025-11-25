---@type vim.lsp.Config
return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        typeCheckingMode = 'basic',
        useLibraryCodeForTypes = true,
      },
    },
  },
}
