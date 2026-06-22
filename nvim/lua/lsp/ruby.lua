vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.rb",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local view = vim.fn.winsaveview()
    local has_bundle = vim.fs.root(bufnr, { 'Gemfile' }) ~= nil
    local cmd = has_bundle and { 'bundle', 'exec', 'rubocop', '-A', filename } or { 'rubocop', '-A', filename }
    vim.fn.system(cmd)
    vim.cmd('edit!')
    vim.fn.winrestview(view)
  end,
})

vim.lsp.config('ruby_lsp', {
  cmd = { '/opt/homebrew/lib/ruby/gems/4.0.0/bin/ruby-lsp' },
  filetypes = { 'ruby' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { 'Gemfile', 'Gemfile.lock', '.git' })
    on_dir(root or vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':h'))
  end,
  init_options = {
    formatter = 'rubocop_internal',
    linters = {},
  },
})

vim.lsp.enable('ruby_lsp')
