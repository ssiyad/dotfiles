require('tokyonight').setup({
    lualine_bold = true,
    style = 'night',
    terminal_colors = true,
    transparent = true,
    styles = {
        sidebars = 'transparent'
    }
})

vim.cmd [[ colorscheme tokyonight ]]

