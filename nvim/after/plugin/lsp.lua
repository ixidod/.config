-- --- UI niceties
vim.opt.signcolumn = 'yes'

-- --- LSP-driven keymaps (only when a client attaches)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', '<leader>e', function()
      vim.diagnostic.open_float(nil, { focus = false, border = 'rounded' })
    end, opts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
  end,
})

-- Capabilities from nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Helper: merge with existing defaults (provided by nvim-lspconfig)
local function with_defaults(name, overrides)
  local base = vim.deepcopy(vim.lsp.config[name] or {})
  return vim.tbl_deep_extend('force', base, overrides or {})
end

-- ---- Per-server configs (new style)

vim.lsp.config['yamlls'] = with_defaults('yamlls', {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemaStore = { enable = true },
      schemas = {
        ['https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json'] = 'cf*.yml',
        ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = '.gitlab-ci.yml',
        ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*.yml',
        kubernetes = 'k8s/*.yaml',
      },
    },
    validate = true,
    completion = true,
    hover = true,
  },
})

vim.lsp.config['pyright'] = with_defaults('pyright', {
  capabilities = capabilities,
  settings = {
    python = {
      venvPath = '.',
      venv = 'venv',
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
        typeCheckingMode = 'basic',
        autoImportCompletions = true,

        reportUnusedImport = 'warning',
        reportUnusedVariable = 'warning',
        reportMissingImports = 'warning',
        reportOptionalMemberAccess = 'warning',
        reportOptionalSubscript = 'warning',
      },
    },
  },
})

vim.lsp.config['gopls'] = with_defaults('gopls', {
  capabilities = capabilities,
})

vim.lsp.config['lua_ls'] = with_defaults('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config['terraformls'] = with_defaults('terraformls', {
  capabilities = capabilities,
  filetypes = { 'terraform', 'tf', 'hcl' },
  settings = {
    terraform = {
      languageServer = {
        experimentalFeatures = {
          ignoreSingleFileWarning = true,
        },
      },
    },
  },
})

vim.lsp.config['helm_ls'] = with_defaults('helm_ls', {
  capabilities = capabilities,
})

vim.lsp.config['html'] = with_defaults('html', {
  capabilities = capabilities,
  filetypes = { 'html' },
  settings = {
    html = {
      format = { enable = true },
      hover = { documentation = true },
      validate = true,
      autoClosingTags = true,
    },
  },
})

-- ---- Start the right server when a buffer with a matching filetype opens

local ft_to_server = {
  yaml = 'yamlls',
  yml = 'yamlls',
  go = 'gopls',
  lua = 'lua_ls',
  terraform = 'terraformls',
  tf = 'terraformls',
  hcl = 'terraformls',
  helm = 'helm_ls',
  html = 'html',
  python = 'pyright',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = vim.tbl_keys(ft_to_server),
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local name = ft_to_server[ft]
    if not name then
      return
    end
    local cfg = vim.deepcopy(vim.lsp.config[name] or {})
    -- Make sure the client associates with the current buffer
    cfg.bufnr = args.buf
    vim.lsp.start(cfg)
  end,
})
