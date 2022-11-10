return require('lspconfig').tsserver.setup {
    capabilities = require 'lsp.capabilites' (),
    filetypes = { 
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx'
    },
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers'
}

