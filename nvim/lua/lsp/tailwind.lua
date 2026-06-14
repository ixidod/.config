vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.html", "*.css", "*.scss" },
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

vim.lsp.config('tailwindcss', {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = {
    'html', 'css', 'scss',
    'javascript', 'javascriptreact',
    'typescript', 'typescriptreact',
  },
  root_markers = {
    'tailwind.config.js', 'tailwind.config.ts', 'tailwind.config.cjs',
    'postcss.config.js', 'postcss.config.ts',
    'package.json', '.git',
  },
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
    },
  },
})

vim.lsp.enable('tailwindcss')
