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
    custom_highlights = function(colors)
        return {
            FloatBorder = { bg = colors.mantle },
            NvimTreeNormal = { bg = colors.none },
        }
    end
})

vim.cmd.colorscheme('catppuccin')

