require("rest-nvim").setup()

opts = {
    noremap = true,
}

vim.api.nvim_set_keymap('n', '<Leader>rr', '<Plug>RestNvim', opts)
vim.api.nvim_set_keymap('n', '<Leader>rp', '<Plug>RestNvimPreview', opts)
vim.api.nvim_set_keymap('n', '<Leader>rl', '<Plug>RestNvimLast', opts)

