require'nvim-tree'.setup({
    auto_close = true,
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    view = {
        hide_root_folder = false,
        auto_resize = true,
        side = 'left',
    },
})

vim.api.nvim_set_keymap('n', '<C-\'>', ':NvimTreeToggle<CR>', { noremap = true })

