local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>db', '<Cmd>DBUIToggle<CR>', { desc = 'Toggle Dadbod UI' })

  local group = vim.api.nvim_create_augroup('DadbodCompletion', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = { 'sql', 'mysql', 'plsql' },
    callback = function(args)
      vim.bo[args.buf].omnifunc = 'vim_dadbod_completion#omni'
    end,
  })
end

return M
