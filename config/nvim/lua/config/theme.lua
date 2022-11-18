require('catppuccin').setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        markdown = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow = true,
    },
})

vim.cmd.colorscheme('catppuccin')

