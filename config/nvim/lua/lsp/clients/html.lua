return require('lspconfig').html.setup {
    capabilities = require 'lsp.capabilites' (),
    handlers = require 'lsp.handlers',
    on_attach = require 'lsp.on_attach',
}
