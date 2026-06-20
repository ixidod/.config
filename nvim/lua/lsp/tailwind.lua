vim.lsp.config('tailwindcss', {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = {
    'html', 'css', 'scss',
    'javascript', 'javascriptreact',
    'typescript', 'typescriptreact',
    'php', 'blade',
  },
  root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', '.git' },
})

vim.lsp.enable('tailwindcss')
