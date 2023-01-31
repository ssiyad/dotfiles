require('lspconfig').volar.setup({
	filetypes = {
		'typescript',
		'javascript',
		'javascriptreact',
		'typescriptreact',
		'vue',
		'json',
	},
	init_options = {
		typescript = {
			tsdk = "/opt/homebrew/lib/node_modules/typescript/lib/"
		},
	},
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers',
})
