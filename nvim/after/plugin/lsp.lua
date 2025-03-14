-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- You'll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemaStore = { enable = true },
      schemas = {
        ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = '.gitlab-ci.yml',
        ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*.yml',
        kubernetes = 'k8s/*.yaml',
      },
    },
    validate = true,
    completion = true,
    hover = true,
  },
}
require('lspconfig').gopls.setup {}
require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true), -- Add Neovim runtime files
      },
      telemetry = {
        enable = false, -- Optional: Disable telemetry
      },
    },
  },
}
require('lspconfig').terraformls.setup {
  filetypes = { 'terraform', 'tf', 'hcl' },
}
require('lspconfig').helm_ls.setup {}
require('lspconfig').html.setup {
  filetypes = { 'html' },
  settings = {
    html = {
      format = { enable = true },
      hover = { documentation = true },
      validate = true,
      autoClosingTags = true,
    },
  },
}
