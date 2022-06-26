local handlers =  {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'solid'
    }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'sold'
    }),
}

return handlers
