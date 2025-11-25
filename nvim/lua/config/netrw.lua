local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Back to netrw listing' })
end

return M
