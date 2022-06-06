require('gitsigns').setup()

opts = { noremap = true, silent = true }

vim.keymap.set('n', 'hs', ':Gitsigns stage_hunk<CR>', opts)
vim.keymap.set('n', 'hu', ':Gitsigns undo_stage_hunk<CR>', opts)
vim.keymap.set('n', 'hp', ':Gitsigns preview_hunk<CR>', opts)
vim.keymap.set('n', 'hr', ':Gitsigns reset_hunk<CR>', opts)

