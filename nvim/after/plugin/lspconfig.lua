local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})
lsp.format_on_save({
	format_opts = {
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = {
			"javascript",
			"typescript",
			"lua",
			"c",
			"html",
			"css",
			"prisma",
			"javascriptreact",
			"typescriptreact",
		},
	},
})
lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.clang_format,
	},
})
