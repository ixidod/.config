vim.lsp.config('ruby_lsp', {
  cmd = { '/opt/homebrew/lib/ruby/gems/4.0.0/bin/ruby-lsp' },
  filetypes = { 'ruby' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { 'Gemfile', 'Gemfile.lock', '.git' })
    on_dir(root or vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':h'))
  end,
  init_options = {
    formatter = 'none',
    linters = {},
  },
})

vim.lsp.enable('ruby_lsp')
