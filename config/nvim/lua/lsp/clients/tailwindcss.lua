return require('lspconfig').tailwindcss.setup {
    filetypes = { 
        "javascriptreact",
        "typescriptreact",
    },
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers'
}

