local keymap_set = require("utils.keymap_set")
local workspace = "neorg"
local workspace_dir = "~/neorg"

require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {
			config = {
				icon_preset = "diamond",
			},
		},
		["core.dirman"] = {
			config = {
				workspaces = {
					[workspace] = workspace_dir,
				},
				default_workspace = workspace,
			},
		},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.journal"] = {
			config = {
				workspace = workspace,
			},
		},
	},
})

keymap_set("n", "<Leader>j", function()
	vim.cmd("tabnew")
	vim.cmd("Neorg journal today")
end)