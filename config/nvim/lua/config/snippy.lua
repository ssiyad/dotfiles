require("snippy").setup({
	scopes = {
		_ = function(scopes)
			table.insert(scopes, "misc")
			return scopes
		end,
		typescript = function(scopes)
			table.insert(scopes, "javascript")
			return scopes
		end,
		typescriptreact = function(scopes)
			table.insert(scopes, "javascript")
			return scopes
		end,
	},
})
