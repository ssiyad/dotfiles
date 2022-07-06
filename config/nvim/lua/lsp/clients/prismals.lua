require('lspconfig').prismals.setup {
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers'
}

