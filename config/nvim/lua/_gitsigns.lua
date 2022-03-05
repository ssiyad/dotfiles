require('gitsigns').setup()

vim.api.nvim_set_keymap('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>', { noremap = true })

