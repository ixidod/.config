vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rb", "*.rake", "*.gemspec", "Gemfile", "Rakefile" },
  callback = function(args)
    local clients = vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" })
    if #clients > 0 then
      vim.lsp.buf.format({ bufnr = args.buf })
    end
  end,
})

-- Fallback for buffers with no LSP formatter configured (e.g. scratch files
-- with no Gemfile): run standardrb on the file after it's written to disk,
-- then reload it.
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.rb", "*.rake", "*.gemspec", "Gemfile", "Rakefile" },
  callback = function(args)
    local clients = vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" })
    if #clients == 0 then
      local file = vim.api.nvim_buf_get_name(args.buf)
      vim.system({ "standardrb", "--fix", file }, {}, function()
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(args.buf) then
            vim.api.nvim_buf_call(args.buf, function()
              vim.cmd("checktime")
            end)
          end
        end)
      end)
    end
  end,
})

vim.lsp.config('ruby_lsp', {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = 'auto',
  },
})

vim.lsp.enable('ruby_lsp')
