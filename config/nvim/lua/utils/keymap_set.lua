--- set the keymap, with opts
---@param mode string
---@param keymap string
---@param action function | string
local function keymap_set(mode, keymap, action)
	vim.keymap.set(mode, keymap, action, {
		noremap = true,
		silent = true,
	})
end

return keymap_set
