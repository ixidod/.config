local M = {}

function M.setup()
  local ok, rose_pine = pcall(require, 'rose-pine')
  if not ok then
    vim.notify('rose-pine is not installed', vim.log.levels.WARN)
    return
  end

  rose_pine.setup({
    variant = 'main',
    dark_variant = 'main',
  })
  vim.cmd('colorscheme rose-pine')
end

return M
