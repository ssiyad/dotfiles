local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local set_keymap = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

telescope.setup({
	defaults = themes.get_dropdown({
		borderchars = {
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
		},
		color_devicons = true,
		dynamic_preview_title = true,
		entry_prefix = "  ",
		initial_mode = "insert",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		layout_strategy = "horizontal",
		path_display = {
			truncate = 3,
		},
		previewer = false,
		prompt_prefix = "» ",
		prompt_title = false,
		selection_caret = "  ",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		sroll_strategy = "cycle",
		width = 0.8,
		winblend = 0,
		wrap_results = true,
	}),
})

set_keymap("n", "<Leader>ff", builtin.find_files, opts)
set_keymap("n", "<Leader>fr", builtin.lsp_references, opts)
set_keymap("n", "<Leader>gc", builtin.git_commits, opts)
set_keymap("n", "<Leader>fg", telescope.extensions.live_grep_args.live_grep_args, opts)
set_keymap("n", "<Leader>ft", ":TodoTelescope<CR>", opts)
