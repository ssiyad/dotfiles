require("gitsigns").setup({
	attach_to_untracked = false,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "solid",
		style = "minimal",
		relative = "cursor",
	},
})
