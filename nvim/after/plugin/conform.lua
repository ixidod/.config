require('conform').setup {
	formatters_by_ft = {
		html = { 'prettierd' },
		lua = { 'stylua' },
		python = { 'isort', 'black' },
		javascript = { 'prettier', stop_after_first = true },
		yaml = { 'prettierd' },
		helm = { 'prettierd' },
		terraform = { 'tofu_fmt' },
		hcl = { "tofu_fmt" },
	},
}

require('conform').setup {
	format_on_save = {
		timeout_ms = 500,
		lsp_format = 'fallback',
	},
}
