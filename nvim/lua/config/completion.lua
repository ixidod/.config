local M = {}

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
    if char:match('[%(%){}%[%],.:;]') then
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
      local has_formatter = false
      for _, client in ipairs(clients) do
        local matches_filter = not opts.filter or opts.filter(client)
        if
          matches_filter
          and client.server_capabilities
          and client.server_capabilities.documentFormattingProvider
        then
          has_formatter = true
          break
        end
      end

      if not has_formatter then
        if opts.fallback then
          opts.fallback(bufnr)
          return
        end
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

function M.setup()
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
      vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if not client then
        return
      end

      local ft = vim.bo[event.buf].filetype
      if ft == 'lua' then
        format_on_save(event.buf, {
          filter = function(c)
            return c.name == 'lua_ls' or c.name == 'lua-language-server'
          end,
        })
      elseif ft == 'python' then
        local fallback
        local ok, python_config = pcall(require, 'config.languages.python')
        if ok and type(python_config.format_with_black) == 'function' then
          fallback = function(bufnr)
            python_config.format_with_black(bufnr)
          end
        end
        format_on_save(event.buf, {
          filter = function(c)
            return c.name == 'pyright'
          end,
          fallback = fallback,
        })
      elseif vim.tbl_contains({ 'sql', 'yaml', 'yml' }, ft) then
        format_on_save(event.buf)
      end

      if client.server_capabilities and client.server_capabilities.completionProvider then
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

  vim.keymap.set('i', '<Tab>', function()
    return tab_complete('<Tab>')
  end, { expr = true, silent = true })

  vim.keymap.set('i', '<S-Tab>', function()
    return s_tab_complete('<S-Tab>')
  end, { expr = true, silent = true })
end

return M
