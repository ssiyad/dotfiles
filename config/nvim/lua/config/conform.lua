local conform = require("conform")
local js = {
	"eslint_d",
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
	format_after_save = function()
		local options = {
			lsp_fallback = true,
		}
		local callback = function()
			-- Use `GuessIndent` plugin to (re)set indentation
			vim.cmd(":GuessIndent")
		end
		return options, callback
	end,
})
