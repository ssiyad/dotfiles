return require('lspconfig').tailwindcss.setup {
    capabilities = require 'lsp.capabilites' (),
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers'
}

