local cmp = require 'cmp'
cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(), -- Close completion menu
    ['<CR>'] = cmp.mapping.confirm { select = true }, -- Confirm selection
    ['<Tab>'] = cmp.mapping.select_next_item(), -- Next item
    ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Previous item
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' }, -- LSP completions
    { name = 'buffer' }, -- Buffer words (optional)
    { name = 'path' }, -- File paths (optional)
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}
