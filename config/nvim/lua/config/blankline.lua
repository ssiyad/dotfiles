require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = false,
}

local colors = require("tokyonight.colors").setup()

vim.cmd(
    string.format(
        [[ highlight IndentBlanklineContextChar guifg=%s gui=nocombine ]],
        colors.purple
    )
) 

