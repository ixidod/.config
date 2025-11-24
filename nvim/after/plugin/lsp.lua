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

local ft_to_server = {}

local function configure_server(name, overrides)
  local config = with_defaults(name, overrides)
  vim.lsp.config[name] = config
  if config.filetypes then
    for _, ft in ipairs(config.filetypes) do
      ft_to_server[ft] = name
    end
  end
end

-- ---- Per-server configs (new style)
configure_server('yamlls', {
  capabilities = capabilities,
  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values', 'yml' },
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

configure_server('pyright', {
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

configure_server('gopls', {
  capabilities = capabilities,
})

configure_server('lua_ls', {
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

configure_server('terraformls', {
  capabilities = capabilities,
  filetypes = { 'terraform', 'terraform-vars', 'tf', 'hcl' },
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

configure_server('helm_ls', {
  capabilities = capabilities,
})

configure_server('html', {
  capabilities = capabilities,
  settings = {
    html = {
      format = { enable = true },
      hover = { documentation = true },
      validate = true,
      autoClosingTags = true,
    },
  },
})

configure_server('sqls', {
  capabilities = capabilities,
  cmd = { 'sqls' },
  filetypes = { 'sql', 'mysql' },
  root_markers = { 'config.yml', 'config.yaml', 'sqls.yml' },
  settings = {
    sqls = {
      connections = {},
    },
  },
})

-- ---- Start the right server when a buffer with a matching filetype opens
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
