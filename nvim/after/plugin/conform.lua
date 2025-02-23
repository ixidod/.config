require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    -- Conform will run multiple formatters sequentially
    python = { 'isort', 'black' },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { 'rustfmt', lsp_format = 'fallback' },
    -- Conform will run the first available formatter
    javascript = { 'prettier', stop_after_first = true },
    yaml = { 'prettier' },
    formatters = {
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '$FILENAME' },
      },
    },
    terraform = { 'terraform_fmt' },
    ['terraform-vars'] = { 'terraform_fmt' },
  },
}

require('conform').setup {
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}
