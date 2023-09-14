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
	format_after_save = {
		lsp_fallback = true,
	},
})
