require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

require('telescope').load_extension('fzy_native')

vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope lsp_references<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', ':TodoTelescope<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Telescope git_commits<CR>', { noremap = true })

