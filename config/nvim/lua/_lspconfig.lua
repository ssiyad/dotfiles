local remap = vim.api.nvim_set_keymap

local servers = {
    'gopls',
    'pyright',
    'rust_analyzer',
    'tsserver',
}

vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        eval_snips = '<leader>j',
        recommended = false,
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
                vim.diagnostic.config({
                    virtual_text = false,
                    signs = true,
                    underline = true,
                    update_in_insert = false,
                    severity_sort = false,
                })

                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        local opts = {
                            focusable = false,
                            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                            border = 'rounded',
                            source = 'always',
                            prefix = ' ',
                            scope = 'cursor',
                        }
                        vim.diagnostic.open_float(nil, opts)
                    end
                })

                local function goto_definition(split_cmd)
                    local util = vim.lsp.util
                    local log = require("vim.lsp.log")
                    local api = vim.api

                    local handler = function(_, result, ctx)
                        if result == nil or vim.tbl_isempty(result) then
                            local _ = log.info() and log.info(ctx.method, "No location found")
                            return nil
                        end

                        if split_cmd then
                            vim.cmd(split_cmd)
                        end

                        if vim.tbl_islist(result) then
                            util.jump_to_location(result[1])

                            if #result > 1 then
                                util.set_qflist(util.locations_to_items(result))
                                api.nvim_command("copen")
                                api.nvim_command("wincmd p")
                            end
                        else
                            util.jump_to_location(result)
                        end
                    end

                    return handler
                end

                vim.lsp.handlers["textDocument/definition"] = goto_definition('split')

                if client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_augroup('lsp_document_highlight', {
                        clear = false
                    })
                    vim.api.nvim_clear_autocmds({
                        buffer = bufnr,
                        group = 'lsp_document_highlight',
                    })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        group = 'lsp_document_highlight',
                        buffer = bufnr,
                        callback = vim.lsp.buf.document_highlight,
                    })
                    vim.api.nvim_create_autocmd('CursorMoved', {
                        group = 'lsp_document_highlight',
                        buffer = bufnr,
                        callback = vim.lsp.buf.clear_references,
                    })
                end

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

remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

