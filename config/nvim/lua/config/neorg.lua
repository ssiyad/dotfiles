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
					diary = "~/neorg-diary",
					work = "~/neorg-work",
				},
				index = "index.norg",
			},
		},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
	},
})
