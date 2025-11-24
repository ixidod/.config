vim.cmd('syntax on')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.ignorecase = true

vim.g.mapleader = ' '

vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/fatih/vim-go' },
  { src = 'https://github.com/rose-pine/neovim' },
  { src = 'https://github.com/nanotee/sqls.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/tpope/vim-dadbod' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-ui' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-completion' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
require('rose-pine').setup({
  variant = 'main',
  dark_variant = 'main',
})
vim.cmd('colorscheme rose-pine')

-- Automatically insert matching brackets/quotes while typing.
require('nvim-autopairs').setup({})

-- Telescope fuzzy finder powered by plenary + fzf extension.
local telescope = require('telescope')
telescope.setup({
  defaults = {
    path_display = { 'smart' },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})
pcall(telescope.load_extension, 'fzf')

-- Configure lua-language-server so it knows about the global `vim` object and formats with 2 spaces.
vim.lsp.config('lua_ls', {
  -- Explicit command keeps the server discoverable when vim.lsp.enable() spawns it.
  cmd = { 'lua-language-server' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(
      vim.api.nvim_buf_get_name(bufnr),
      { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', '.git' }
    )
    on_dir(root or vim.fn.getcwd())
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = 'space',
          indent_size = '2',
        },
      },
    },
  },
})

vim.lsp.enable('pyright')
vim.lsp.enable('sqls')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('yamlls')

-- Sets up automatic completion requests for a buffer by listening to insert events.
-- bufnr: buffer handle where completion should autotrigger.
local function setup_auto_completion(bufnr)
  local group = vim.api.nvim_create_augroup(
    string.format('nvim_lsp_completion_auto_%d', bufnr),
    { clear = true }
  )

  -- Decides whether the current InsertCharPre event should trigger completion.
  -- Returns true when the typed character is not whitespace or a bracket.
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

-- Registers BufWritePre formatting for a buffer using LSP formatting.
-- bufnr: buffer that should format before saving.
-- opts: extra options forwarded to vim.lsp.buf.format (e.g. filter).
-- If no matching LSP clients are attached the format call is skipped to avoid noisy errors.
local function format_on_save(bufnr, opts)
  opts = opts or {}
  local warned = false
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup(
      string.format('nvim_lsp_format_%d', bufnr),
      { clear = true }
    ),
    buffer = bufnr,
    callback = function()
      local clients = vim.lsp.get_clients({ bufnr = bufnr })
      local has_formatter = vim.iter(clients):any(function(client)
        local matches_filter = not opts.filter or opts.filter(client)
        return matches_filter and client.server_capabilities.documentFormattingProvider
      end)

      if not has_formatter then
        if not warned then
          warned = true
          vim.schedule(function()
            vim.notify(
              string.format('No formatting LSP attached for %s', vim.bo[bufnr].filetype),
              vim.log.levels.WARN
            )
          end)
        end
        return
      end

      local format_opts = vim.tbl_extend(
        'force',
        { bufnr = bufnr, async = false },
        opts
      )
      vim.lsp.buf.format(format_opts)
    end,
  })
end

-- Wire up built-in LSP completion.
vim.api.nvim_create_autocmd('LspAttach', {
  -- Runs whenever an LSP client attaches to a buffer so we can configure omnifunc,
  -- formatting on save and autocompletion hooks.
  callback = function(event)
    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    local ft = vim.bo[event.buf].filetype
    if ft == 'lua' then
      format_on_save(event.buf, {
        filter = function(client)
          return client.name == 'lua_ls'
        end,
      })
    elseif vim.tbl_contains({ 'sql', 'yaml', 'yml' }, ft) then
      format_on_save(event.buf)
    end

    if client.server_capabilities.completionProvider then
      vim.lsp.completion.enable(true, client.id, event.buf)
      setup_auto_completion(event.buf)
    end
  end,
})

vim.keymap.set('i', '<C-Space>', function()
  vim.lsp.completion.get()
end, { desc = 'Trigger LSP completion' })
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float()
end, { desc = 'Show diagnostics under cursor' })
vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files()
end, { desc = 'Find files via Telescope' })
vim.keymap.set('n', '<leader>fg', function()
  require('telescope.builtin').live_grep()
end, { desc = 'Live grep via Telescope' })

-- Handles Tab in insert mode: cycles completion items when the popup menu is visible.
local function tab_complete(fallback)
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  end
  return fallback
end

-- Handles Shift-Tab in insert mode: moves up in the completion menu or falls back.
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
