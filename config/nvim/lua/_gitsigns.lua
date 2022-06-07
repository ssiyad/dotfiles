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

opts = { noremap = true, silent = true }

vim.keymap.set('n', 'hs', ':Gitsigns stage_hunk<CR>', opts)
vim.keymap.set('n', 'hu', ':Gitsigns undo_stage_hunk<CR>', opts)
vim.keymap.set('n', 'hp', ':Gitsigns preview_hunk<CR>', opts)
vim.keymap.set('n', 'hr', ':Gitsigns reset_hunk<CR>', opts)

