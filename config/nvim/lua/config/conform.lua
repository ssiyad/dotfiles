local conform = require("conform")
local js = {
	"eslint",
}

conform.setup({
	formatters_by_ft = {
		lua = {
			"stylua",
		},
		python = {
			"isort",
			"black",
		},
		javascript = js,
		typescript = js,
		vue = js,
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
