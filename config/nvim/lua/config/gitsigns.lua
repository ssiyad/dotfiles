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

vim.keymap.set('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>', opts)
vim.keymap.set('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>', opts)
vim.keymap.set('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>', opts)
vim.keymap.set('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>', opts)

