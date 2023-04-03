local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.code_actions.eslint,
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.completion.spell,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.hover.dictionary,
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
