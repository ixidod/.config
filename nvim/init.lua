vim.cmd('syntax on')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.ignorecase = true

vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/fatih/vim-go' },
  { src = 'https://github.com/rose-pine/neovim' },
  { src = 'https://github.com/nanotee/sqls.nvim' },
}

require('rose-pine').setup({
  variant = 'main',
  dark_variant = 'main',
})
vim.cmd('colorscheme rose-pine')

vim.lsp.enable('pyright')
vim.lsp.enable('sqls')
vim.lsp.enable('gopls')

local function setup_auto_completion(bufnr)
  local group = vim.api.nvim_create_augroup(
    string.format('nvim_lsp_completion_auto_%d', bufnr),
    { clear = true }
  )

  local function should_trigger()
    local char = vim.v.char or ''
    if char:match('%s') then
      return false
    end
    if char:match('[%(%){}%[%]]') then
      return false
    end
    return true
  end

  vim.api.nvim_create_autocmd('InsertCharPre', {
    group = group,
    buffer = bufnr,
    callback = function()
      if should_trigger() then
        vim.lsp.completion.get()
      end
    end,
  })
end

-- Wire up built-in LSP completion.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client or not client.server_capabilities.completionProvider then
      return
    end

    vim.lsp.completion.enable(true, client.id, event.buf)
    setup_auto_completion(event.buf)
  end,
})

vim.keymap.set('i', '<C-Space>', function()
  vim.lsp.completion.get()
end, { desc = 'Trigger LSP completion' })

local function tab_complete(fallback)
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  end
  return fallback
end

local function s_tab_complete(fallback)
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  end
  return fallback
end

vim.keymap.set('i', '<Tab>', function()
  return tab_complete('<Tab>')
end, { expr = true, silent = true })

vim.keymap.set('i', '<S-Tab>', function()
  return s_tab_complete('<S-Tab>')
end, { expr = true, silent = true })
