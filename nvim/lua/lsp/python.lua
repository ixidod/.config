-- Auto-format on save using pyright's formatter (ruff if available)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py" },
  callback = function()
    local view = vim.fn.winsaveview()
    vim.lsp.buf.format({ name = "ruff_lsp", async = false, timeout_ms = 2000 })
    vim.fn.winrestview(view)
  end,
})

-- Pyright: type checking, completion, go-to-definition, hover, etc.
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    '.git',
  },
  settings = {
    pyright = {
      -- Use ruff for imports organisation so pyright doesn't conflict
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'basic',
      },
    },
  },
})

-- Ruff: fast linting + formatting (replaces flake8, isort, black, etc.)
vim.lsp.config('ruff_lsp', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'ruff.toml',
    '.ruff.toml',
    'setup.py',
    'setup.cfg',
    '.git',
  },
  init_options = {
    settings = {
      -- point to your ruff binary if it lives in a venv
      interpreter = {},
      logLevel = 'error',
    },
  },
})

vim.lsp.enable('pyright')
vim.lsp.enable('ruff_lsp')
