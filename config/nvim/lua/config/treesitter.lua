require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'c',
        'css',
        'fish',
        'go',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'lua',
        'markdown',
        'prisma',
        'python',
        'regex',
        'rust',
        'tsx',
        'typescript'
    }, 
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
        enable = true
    },
    indent = {
        enable = true
    }
})
