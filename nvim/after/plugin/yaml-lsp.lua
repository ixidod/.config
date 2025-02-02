local capabilities = vim.lsp.protocol.make_client_capabilities()
require("lspconfig").yamlls.setup({
	capabilities = capabilities;
  settings = {
    yaml = {
      format = {
        enable = true,  -- Enables formatting
      },
			validate = true;
			hover = true;
			completion =true;
      schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
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

-- Enable completion support from nvim-cmp
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)


