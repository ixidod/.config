local M = {}

function M.setup()
  local ok, ts = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    vim.notify('nvim-treesitter not installed', vim.log.levels.WARN)
    return
  end

  ts.setup({
    ensure_installed = { 'lua', 'python', 'go', 'sql', 'yaml', 'vimdoc', 'bash', 'json' },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
      },
    },
  })
end

return M
