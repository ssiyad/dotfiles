require('lspconfig').vuels.setup{
    capabilities = require 'lsp.capabilites' (),
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers',
}
