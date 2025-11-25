local M = {}

local servers = {
  lua_ls = require('config.languages.lua_ls'),
  pyright = require('config.languages.python'),
  sqls = require('config.languages.sql'),
  gopls = require('config.languages.go'),
  yamlls = require('config.languages.yaml'),
}

function M.setup()
  for name, config in pairs(servers) do
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
  end
end

return M
