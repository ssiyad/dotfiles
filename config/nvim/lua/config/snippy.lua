require('snippy').setup({
	scopes = {
		_ = { 'misc' },
		typescript = function(scopes)
			table.insert(scopes, 'javascript')
			return scopes
		end,
	},
})
