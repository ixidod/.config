local M = {}

function M.setup()
  local ok, autopairs = pcall(require, 'nvim-autopairs')
  if not ok then
    vim.notify('nvim-autopairs is not installed', vim.log.levels.WARN)
    return
  end
  autopairs.setup({})
end

return M
