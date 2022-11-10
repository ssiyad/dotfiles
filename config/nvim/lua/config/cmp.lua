-- Setup nvim-cmp.
local cmp = require('cmp')

-- import luasnip
local luasnip = require('luasnip')

-- util
local has_words_before = require('utils.has_words_before')

local snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end
}

local mapping = cmp.mapping.preset.insert({
    -- scroll doc up
    ['<C-d>'] = cmp.mapping.scroll_docs(-5),

    -- scroll doc down
    ['<C-f>'] = cmp.mapping.scroll_docs(5),

    -- abort
    ['<C-e>'] = cmp.mapping.abort(),

    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-Space>'] = cmp.mapping.confirm({
        select = true
    }), 

    -- scroll down with luasnip
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item({
                behavior = {
                    select = false
                }
            })
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { "i", "s" }),

    -- scroll up with luasnip
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item({
                behavior = {
                    select = false
                }
            })
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s" }),
})

local sources = cmp.config.sources({
    {
        name = 'nvim_lsp',
        group_index = 1
    },
    {
        name = 'nvim_lsp_signature_help',
        group_index = 2
    },
    {
        name = 'luasnip',
        group_index = 3
    },
    {
        name = 'buffer',
        group_index = 4,
        option = {
            get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
            end
        }
    }
})

local window = {
    completion = {
        border = 'solid',
        col_offset = 2
    },
    documentation = {
        border = 'solid'
    }
}

cmp.setup({
    mapping = mapping,
    snippet = snippet,
    sources = sources,
    window = window,
    experimental = {
        ghost_text = true
    }
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
        { name = 'cmdline' },
        { name = 'path' }
    })
})

-- Dictionary suggestions for markdown and gitcommit
cmp.setup.filetype(
    {
        'markdown',
        'gitcommit',
    },
    {
        sources = cmp.config.sources({
            {
                name = 'dictionary',
                keyword_length = 3,
                max_item_count = 7,
            },
        })
    }
)
