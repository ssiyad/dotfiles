require('snippy').setup({
	scopes = {
		typescript = function(scopes)
			table.insert(scopes, 'javascript')
			return scopes
		end,
	},
})
