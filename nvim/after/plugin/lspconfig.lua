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
