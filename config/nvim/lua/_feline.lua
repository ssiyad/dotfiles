local vi_mode_utils = require('feline.providers.vi_mode')
local gps = require('nvim-gps')

local components = {
    active = {},
    inactive = {},
}

components.active[1] = {
    {
        provider = 'vi_mode',
        hl = function()
            return {
                name = vi_mode_utils.get_mode_highlight_name(),
                bg = vi_mode_utils.get_mode_color(),
                fg = 'whitesmoke',
                style = 'bold',
            }
        end,
        left_sep = {
            str = ' ',
            hl = function()
                return {
                    bg = vi_mode_utils.get_mode_color(),
                }
            end,
        },
        right_sep = {
            str = ' ',
            hl = function()
                return {
                    bg = vi_mode_utils.get_mode_color(),
                }
            end,
        },
        icon = '',
    },
    {
        provider = 'file_info',
        hl = {
            fg = 'khaki',
            style = 'bold'
        },
        left_sep = ' ',
    },
    {
        provider = 'git_branch',
        hl = {
            fg = 'white',
            bg = 'black',
            style = 'bold',
        },
        left_sep = ' ',
    },
    {
        provider = function()
            return gps.get_location()
        end,
        enabled = function()
            return gps.is_available()
        end,
        hl = {
            fg = 'paleturquoise',
            style = 'bold',
        },
        left_sep = ' ',
    }
}

components.active[2] = {
    {
        provider = 'git_diff_added',
        hl = {
            fg = 'green',
            bg = 'black'
        }
    },
    {
        provider = 'git_diff_changed',
        hl = {
            fg = 'orange',
            bg = 'black',
        }
    },
    {
        provider = 'git_diff_removed',
        hl = {
            fg = 'red',
            bg = 'black',
        },
    },
    {
        provider = 'diagnostic_errors',
        hl = {
            fg = 'red',
            style = 'bold',
        },
    },
    {
        provider = 'diagnostic_warnings',
        hl = {
            fg = 'yellow',
            style = 'bold',
        },
        left_sep = ' ',
    },
    {
        provider = 'diagnostic_hints',
        hl = {
            fg = 'cyan',
            style = 'bold',
        },
        left_sep = ' ',
    },
    {
        provider = 'position',
        hl = {
            fg = 'yellowgreen',
            style = 'bold'
        },
        left_sep = ' ',
    },
    {
        provider = 'diagnostic_info',
        hl = {
            fg = 'skyblue',
            style = 'bold',
        },
        left_sep = ' ',
    },
    {
        provider = 'file_size',
        hl = {
            fg = 'blueviolet',
            style = 'bold'
        },
        left_sep = ' ',
    },
    {
        provider = 'line_percentage',
        hl = {
            style = 'bold'
        },
        left_sep = ' ',
        right_sep = ' ',
    },
}

components.inactive[1] = {
    {
        provider = 'file_info',
        hl = {
            fg = 'white',
            bg = '#262339',
            style = 'bold',
        },
        left_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = '#262339',
            }
        },
        right_sep = {
            {
                str = ' ',
                hl = {
                    fg = 'NONE',
                    bg = '#262339',
                }
            },
            'slant_right'
        }
    },
    -- Empty component to fix the highlight till the end of the statusline
    {
    }
}

require('feline').setup({
    preset = 'default',
    components = components,
})
