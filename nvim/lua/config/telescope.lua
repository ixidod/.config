local M = {}

function M.setup()
  local ok, telescope = pcall(require, 'telescope')
  if not ok then
    vim.notify('telescope.nvim is not installed', vim.log.levels.WARN)
    return
  end

  telescope.setup({
    defaults = {
      path_display = { 'smart' },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  })

  pcall(telescope.load_extension, 'fzf')

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files via Telescope' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep via Telescope' })
end

return M
