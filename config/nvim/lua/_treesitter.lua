require('nvim-treesitter.configs').setup({
    ensure_installed = "maintained", 
    sync_install = true, 
    highlight = {
        enable = true, 
        additional_vim_regex_highlighting = false
    },
    rainbow = {
        enable = true,
        extended_mode = true, 
        max_file_lines = nil 
    },
    context_commentstring = {
        enable = true
    },
    matchup = {
        enable = true,              
    },
    indent = {
        enable = true
    }
})
