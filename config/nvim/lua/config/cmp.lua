-- Setup nvim-cmp.
local cmp = require("cmp")

-- import snippy
local snippy = require("snippy")

-- import neogen, documentation generator
local neogen = require("neogen")

-- import autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- util
local has_words_before = require("utils.has_words_before")

local snippet = {
	expand = function(args)
		snippy.expand_snippet(args.body)
	end,
}

local mapping = cmp.mapping.preset.insert({
	-- scroll doc up
	["<C-d>"] = cmp.mapping.scroll_docs(-5),
	-- scroll doc down
	["<C-f>"] = cmp.mapping.scroll_docs(5),
	-- abort
	["<C-e>"] = cmp.mapping.abort(),
	-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	["<C-Space>"] = cmp.mapping.confirm({
		select = true,
	}),
	["<C-j>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item({
				behavior = {
					select = false,
				},
			})
		elseif neogen.jumpable() then
			neogen.jump_next()
		elseif snippy.can_jump(1) then
			snippy.next()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),
	["<C-k>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item({
				behavior = {
					select = false,
				},
			})
		elseif neogen.jumpable(true) then
			neogen.jump_prev()
		elseif snippy.can_jump(-1) then
			snippy.previous()
		else
			fallback()
		end
	end, { "i", "s" }),
})

local sources = cmp.config.sources({
	{
		name = "snippy",
		group_index = 1,
	},
	{
		name = "nvim_lsp",
		group_index = 2,
	},
	{
		name = "neorg",
		group_index = 3,
	},
	{
		name = "copilot",
		group_index = 4,
	},
	{
		name = "nvim_lsp_signature_help",
		group_index = 5,
	},
	{
		name = "buffer",
		group_index = 6,
		option = {
			get_bufnrs = function()
				local bufs = {}
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					bufs[vim.api.nvim_win_get_buf(win)] = true
				end
				return vim.tbl_keys(bufs)
			end,
		},
	},
})

local window = {
	completion = {
		border = "solid",
		col_offset = 2,
	},
	documentation = {
		border = "solid",
	},
}

cmp.setup({
	mapping = mapping,
	snippet = snippet,
	sources = sources,
	window = window,
	-- experimental = {
	--     ghost_text = true
	-- }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "cmdline" },
		{ name = "path" },
	}),
})

-- Dictionary suggestions for markdown and gitcommit
cmp.setup.filetype({
	"gitcommit",
	"markdown",
	"norg",
}, {
	sources = cmp.config.sources({
		{
			name = "dictionary",
			keyword_length = 3,
		},
	}),
})

-- listen for confirmation
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
