vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.mjs", "*.cjs" },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    if vim.fn.executable('prettier') == 1 then
      local lines = vim.fn.systemlist(
        'prettier --stdin-filepath ' .. vim.fn.shellescape(filepath),
        vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      )
      if vim.v.shell_error == 0 then
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
      end
    else
      vim.lsp.buf.format({ timeout_ms = 3000 })
    end
  end,
})

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'relative',
    },
  },
})

vim.lsp.enable('ts_ls')
