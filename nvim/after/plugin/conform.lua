local conform = require 'conform'

-- Configure formatters once so format-on-save reuses the same rules.
conform.setup {
  formatters_by_ft = {
    html = { 'prettierd', 'prettier', stop_after_first = true },
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    yaml = { 'prettierd' },
    helm = { 'prettierd' },
    terraform = { 'tofu_fmt' },
    hcl = { 'tofu_fmt' },
    sql = { 'sqlfluff' },
  },
  formatters = {
    sqlfluff = {
      command = 'sqlfluff',
      args = { 'format', '--disable-progress-bar', '--nocolor', '-' },
      stdin = true,
    },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_format = 'fallback',
  },
}
