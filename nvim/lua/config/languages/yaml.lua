---@type vim.lsp.Config
return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yml' },
  settings = {
    yaml = {
      format = { enable = true },
      validate = true,
      hover = true,
      completion = true,
    },
  },
}
