require('lspconfig').volar.setup({
	filetypes = {
		'typescript',
		'javascript',
		'javascriptreact',
		'typescriptreact',
		'vue',
		'json',
	},
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers',
})
