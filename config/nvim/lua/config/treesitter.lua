require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"css",
		"fish",
		"go",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"lua",
		"markdown",
		"prisma",
		"python",
		"regex",
		"rust",
		"tsx",
		"typescript",
		"vue",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
