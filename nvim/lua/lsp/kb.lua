vim.diagnostic.config({ virtual_text = { prefix = '' }, signs = false, underline = true, float = { wrap = true } })

local function resize_netrw()
  local max_len = 0
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    local len = vim.fn.strdisplaywidth(line)
    if len > max_len then
      max_len = len
    end
  end
  vim.cmd('vertical resize ' .. math.max(20, math.min(max_len + 2, 80)))
end

vim.keymap.set('n', '<leader>e', ':Lex<CR>', { silent = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function(args)
    resize_netrw()
    vim.api.nvim_create_autocmd('TextChanged', {
      buffer = args.buf,
      callback = resize_netrw,
    })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show full diagnostic message' })

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

