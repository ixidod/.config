vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.php",
  callback = function()
    local tmpfile = vim.fn.tempname() .. '.php'
    vim.fn.writefile(vim.api.nvim_buf_get_lines(0, 0, -1, false), tmpfile)
    vim.fn.system({ 'php-cs-fixer', 'fix', '--quiet', tmpfile })
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.readfile(tmpfile))
    vim.fn.delete(tmpfile)
  end,
})

vim.lsp.config('intelephense', {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = { 'composer.json', '.git' },
  init_options = {
    storagePath = vim.fn.stdpath('data') .. '/intelephense',
    globalStoragePath = vim.fn.expand('~/.local/share/intelephense'),
    licenceKey = nil,
  },
})

vim.lsp.enable('intelephense')
