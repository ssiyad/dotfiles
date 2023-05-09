local oil = require("oil")
local keymap_set = require("utils.keymap_set")

oil.setup({
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime",
	},
	skip_confirm_for_simple_edits = true,
	preview = {
		border = "solid",
	},
})

keymap_set("n", "<C-\\>", function()
	local dir = vim.fn.expand("%:p:h")
	vim.cmd("tabnew")
	oil.open(dir)
end)
