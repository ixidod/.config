local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

require("lspconfig").yamlls.setup({
  capabilities = capabilities,
  settings = {
    yaml = {
      format = { enable = true },     -- Enables formatting
      validate = true,                -- Enables schema validation
      hover = true,                   -- Enables hover information
      completion = true,              -- Enables autocompletion
      schemas = {
        kubernetes = "*.yaml",
        ["https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/crds/application-crd.yaml"] = "argocd-app.yaml",
        ["https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/crds/appproject-crd.yaml"] = "argocd-project.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.yml",
      },
      schemaStore = {
        enable = true,  -- Automatically pull in schemas from SchemaStore
      },
    },
  },
})


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.yaml", "*.yml" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})



