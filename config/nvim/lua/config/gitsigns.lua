require('gitsigns').setup({
    numhl = true,
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'none',
        style = 'minimal',
        relative = 'cursor',
        row = 1,
        col = 0,
    },
})

