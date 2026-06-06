vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.cs",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.lsp.buf.format()
    vim.fn.winrestview(view)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function(args)
    local root = vim.fs.root(args.buf, function(name)
      return name:match('%.sln$') or name:match('%.slnx$') or name:match('%.csproj$')
    end) or vim.fn.getcwd()

    vim.lsp.start({
      name = "roslyn",
      cmd = { vim.env.HOME .. '/.dotnet/tools/roslyn-language-server', '--stdio', '--autoLoadProjects' },
      root_dir = root,
      capabilities = {
        workspace = {
          didChangeWatchedFiles = { dynamicRegistration = false },
        },
      },
      settings = {
        ["csharp|background_analysis"] = {
          dotnet_analyzer_diagnostics_scope = "fullSolution",
          dotnet_compiler_diagnostics_scope = "fullSolution",
        },
      },
      handlers = {
        ["workspace/_roslyn_projectNeedsRestore"] = function(_, result, ctx)
          local client = vim.lsp.get_client_by_id(ctx.client_id)
          if not client then return end
          local paths = result.projectFilePaths or {}
          local remaining = #paths
          if remaining == 0 then
            client:notify("workspace/_roslyn_projectRestoreComplete", {})
            return
          end
          for _, path in ipairs(paths) do
            vim.system(
              { vim.env.DOTNET_ROOT .. '/dotnet', 'restore', path },
              { text = true },
              vim.schedule_wrap(function()
                remaining = remaining - 1
                if remaining == 0 then
                  client:notify("workspace/_roslyn_projectRestoreComplete", {})
                end
              end)
            )
          end
        end,
      },
    })
  end,
})
