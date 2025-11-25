local M = {}

function M.setup()
  vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_dir = function(bufnr, on_dir)
      local root = vim.fs.root(
        vim.api.nvim_buf_get_name(bufnr),
        { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', '.git' }
      )
      on_dir(root or vim.fn.getcwd())
    end,
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file('', true),
        },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = 'space',
            indent_size = '2',
          },
        },
      },
    },
  })

  vim.lsp.enable('lua_ls')
end

return M
