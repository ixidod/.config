local M = {}

function M.setup()
  vim.lsp.config('yamlls', {
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
  })
  vim.lsp.enable('yamlls')
end

return M
