require'nvim-tree'.setup({
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
        hide_root_folder = true,
        auto_resize = true,
        side = 'left',
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        }
    },
})

vim.api.nvim_set_keymap('n', '<C-o>', ':NvimTreeToggle<CR>', { noremap = true })

