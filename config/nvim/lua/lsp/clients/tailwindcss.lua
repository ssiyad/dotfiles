return require('lspconfig').tailwindcss.setup {
    capabilities = require 'lsp.capabilites' (),
    filetypes = { 
        "javascriptreact",
        "typescriptreact",
    },
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers'
}

