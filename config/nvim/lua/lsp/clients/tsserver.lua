return require('lspconfig').tsserver.setup {
    filetypes = { 
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx' 
    }
}

