vim.lsp.config('dbt_language_server', {
  cmd = { 'dbt-language-server' },
  filetypes = { 'sql', 'yaml' },
  root_markers = { 'dbt_project.yml', 'dbt_project.yaml' },
})

vim.lsp.enable('dbt_language_server')
