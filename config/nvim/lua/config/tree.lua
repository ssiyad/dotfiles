require'nvim-tree'.setup({
    hijack_unnamed_buffer_when_opening = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
        update_root = false,
    },
    hijack_cursor = true,
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    view = {
        adaptive_size = true,
        centralize_selection = true,
        hide_root_folder = true,
        side = 'left',
        signcolumn = "yes"
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "icon",
        indent_markers = {
            enable = true,
        }
    },
    filesystem_watchers = {
        enable = true,
        interval = 500,
    },
})

