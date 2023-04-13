local nvim_tree = require("nvim-tree")
local nvim_tree_api = require("nvim-tree.api")
local keymap_set = require("utils.keymap_set")

nvim_tree.setup({
    hijack_unnamed_buffer_when_opening = true,
    update_focused_file = {
        enable = true,
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
    },
    view = {
        adaptive_size = true,
        centralize_selection = true,
        side = "left",
        signcolumn = "yes",
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "icon",
        indent_markers = {
            enable = true,
        },
        root_folder_label = false,
    },
    filesystem_watchers = {
        enable = true,
    },
    filters = {
        custom = {
            "^\\.git",
        },
    },
})

keymap_set("n", "<C-\\>", nvim_tree_api.tree.toggle)
