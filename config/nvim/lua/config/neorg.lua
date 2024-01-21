local keymap_set = require("utils.keymap_set")
local workspace = "neorg"
local workspace_dir = "~/neorg"
local todo = "~/neorg/todo.norg"

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
				strategy = "nested",
				use_template = false,
				workspace = workspace,
			},
		},
	},
})

keymap_set("n", "<leader>nt", function()
	if vim.fn.expand("%:p") == vim.fn.expand(todo) then
		vim.cmd.tabclose()
		return
	end
	if vim.fn.expand("%:t") ~= "" then
		vim.cmd.tabnew()
	end
	vim.cmd.edit(todo)
end)

keymap_set("n", "<leader>nj", function()
	if vim.fn.expand("%:t") ~= "" then
		vim.cmd.tabnew()
	end
	vim.cmd([[ :Neorg journal today ]])
end)
