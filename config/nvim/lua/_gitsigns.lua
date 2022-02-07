require('gitsigns').setup({
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '█', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
})

vim.api.nvim_set_keymap('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>', { noremap = true })

