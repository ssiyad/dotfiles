require('registers').setup({
	window = {
		-- Don't draw a border around the registers window
		border = 'solid',

		-- Apply a tiny bit of transparency to the the window,
		-- letting some characters behind it bleed through
		transparency = 0,
	},
})
