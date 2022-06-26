require('lspconfig').gopls.setup {
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers'
}
