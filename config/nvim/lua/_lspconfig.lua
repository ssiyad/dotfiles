local servers = {
    'rust_analyzer',
    'tsserver',
}

vim.g.coq_settings = {
    auto_start = true,
}

local coq = require('coq')

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup(
        coq.lsp_ensure_capabilities({
            on_attach = function(client, bufnr)
                require 'lsp_signature'.on_attach()
            end,
            flags = {
                debounce_text_changes = 150,
            },
        })
    )
end

