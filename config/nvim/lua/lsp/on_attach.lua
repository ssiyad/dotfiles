local function f(client, bufnr)
    require('lsp.functions.float_diagnostics')
    require('lsp.functions.goto_definition')
    require('lsp.functions.symbol_highlight')(client, bufnr)
end

return f

