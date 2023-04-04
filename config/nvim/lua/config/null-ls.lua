local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
	b.code_actions.eslint,
	b.code_actions.gitsigns,
	b.code_actions.refactoring,
	b.completion.spell,
	b.diagnostics.eslint,
	b.formatting.black,
	b.formatting.stylua,
	b.hover.dictionary,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
