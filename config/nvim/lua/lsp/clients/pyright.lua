require('lspconfig').pyright.setup {
    capabilities = require('lsp.capabilites')(),
    handlers = require('lsp.handlers'),
    on_attach = require('lsp.on_attach'),
    settings = {
        python = {
            analysis = {
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
            },
        },
    },
}

