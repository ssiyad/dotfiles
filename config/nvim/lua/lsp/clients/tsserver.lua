return require('lspconfig').tsserver.setup {
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

