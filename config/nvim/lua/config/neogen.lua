local neogen = require("neogen")
local keymap_set = require("utils.keymap_set")

neogen.setup({
	enabled = true,
	languages = {
		python = {
			template = {
				annotation_convention = "reST",
			},
		},
	},
})

keymap_set("n", "<Leader>d", neogen.generate)
