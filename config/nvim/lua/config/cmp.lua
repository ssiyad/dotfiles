local servers = {
    'cssls',
    'gopls',
    'pyright',
    'rust_analyzer',
    'tailwindcss',
    'tsserver',
}

-- local has_words_before = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        { name = 'nvim_lsp_signature_help' }
    }, {
            { name = 'buffer' },
        })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- local function goto_definition(split_cmd)
--     local util = vim.lsp.util
--     local log = require("vim.lsp.log")
--     local api = vim.api

--     local handler = function(_, result, ctx)
--         if result == nil or vim.tbl_isempty(result) then
--             local _ = log.info() and log.info(ctx.method, "No location found")
--             return nil
--         end

--         if split_cmd then
--             vim.cmd(split_cmd)
--         end

--         if vim.tbl_islist(result) then
--             util.jump_to_location(result[1])

--             if #result > 1 then
--                 util.set_qflist(util.locations_to_items(result))
--                 api.nvim_command("copen")
--                 api.nvim_command("wincmd p")
--             end
--         else
--             util.jump_to_location(result)
--         end
--     end

--     return handler
-- end

-- local function on_attach(client, bufnr) 
--     function PrintDiagnostics(opts, bufnr, line_nr, client_id)
--         bufnr = bufnr or 0
--         line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
--         opts = opts or {['lnum'] = line_nr}

--         local line_diagnostics = vim.diagnostic.get(bufnr, opts)
--         if vim.tbl_isempty(line_diagnostics) then return end

--         local diagnostic_message = ""
--         for i, diagnostic in ipairs(line_diagnostics) do
--             diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
--             print(diagnostic_message)
--             if i ~= #line_diagnostics then
--                 diagnostic_message = diagnostic_message .. "\n"
--             end
--         end
--         vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
--     end

--     vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

--     vim.lsp.handlers["textDocument/definition"] = goto_definition('split')

--     -- highlight symbol
--     if client.server_capabilities.documentHighlightProvider then
--         vim.api.nvim_create_augroup('lsp_document_highlight', {
--             clear = false
--         })
--         vim.api.nvim_clear_autocmds({
--             buffer = bufnr,
--             group = 'lsp_document_highlight',
--         })
--         vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--             group = 'lsp_document_highlight',
--             buffer = bufnr,
--             callback = vim.lsp.buf.document_highlight,
--         })
--         vim.api.nvim_create_autocmd('CursorMoved', {
--             group = 'lsp_document_highlight',
--             buffer = bufnr,
--             callback = vim.lsp.buf.clear_references,
--         })
--     end

--     local opts = { noremap = true, silent = true, buffer = bufnr }

--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
-- end

-- for _, lsp in pairs(servers) do
--     require('lspconfig')[lsp].setup ({
--         capabilities = capabilities,
--         on_attach = on_attach,
--     })
-- end
