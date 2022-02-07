local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
map('n', '<A-c>', ':BufferClose<CR>', opts)

vim.g.bufferLine = {
    auto_hide = true,
}

