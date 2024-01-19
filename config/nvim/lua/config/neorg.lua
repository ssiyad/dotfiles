local neorg = require("neorg")
local workspace = "neorg"
local workspace_dir = "~/neorg"

neorg.setup({
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
