require('telescope').setup {
    defaults = require('telescope.themes').get_dropdown({
        borderchars = {
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' ',
            ' '
        },
        width = 0.8,
        previewer = false,
        prompt_title = false,
        prompt_prefix = '» ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        sroll_strategy = 'cycle',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        path_display = {
            truncate = 3
        },
        winblend = 0,
        color_devicons = true,
        wrap_results = true,
        dynamic_preview_title = true
    })
}

