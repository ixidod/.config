local jdtls_dir = vim.fn.expand("~/.local/share/jdtls")
local data_dir = vim.fn.stdpath("data") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local launcher = vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_dir = jdtls_dir .. "/config_mac"

vim.lsp.config("jdtls", {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-Xmx2g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", launcher,
    "-configuration", config_dir,
    "-data", data_dir,
  },
  filetypes = { "java" },
  root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" },
  settings = {
    java = {
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      referencesCodeLens = { enabled = true },
      implementationsCodeLens = { enabled = true },
      inlayHints = { parameterNames = { enabled = "all" } },
      format = { enabled = true },
      saveActions = { organizeImports = true },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.mockito.Mockito.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },
  },
})

vim.lsp.enable("jdtls")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.java",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.lsp.buf.format({ async = false })
    vim.fn.winrestview(view)
  end,
})
