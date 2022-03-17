local servers = {
    'gopls',
    'pyright',
    'rust_analyzer',
    'tsserver',
}

vim.g.coq_settings = {
    auto_start = true,
    clients = {
        tabnine = {
            enabled = true,
        },
    },
    keymap = {
        eval_snips = '<leader>j',
    },
    display = {
        pum = {
            kind_context = {'', ''},
            source_context = {'', ''},
        },
        preview = {
            border = 'solid',
        },
        icons = {
            mode = 'short',
        }
    },
}

local coq = require('coq')

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup(
        coq.lsp_ensure_capabilities({
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }

                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

                require 'lsp_signature'.on_attach()
            end,
            flags = {
                debounce_text_changes = 150,
            },
        })
    )
end

