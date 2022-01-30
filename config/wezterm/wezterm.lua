local wezterm = require 'wezterm';

return {
    -- https://wezfurlong.org/wezterm/config/fonts.html
    font = wezterm.font('JetBrainsMono Nerd Font'),
    font_size = 9,

    -- https://wezfurlong.org/wezterm/config/appearance.html
    colors = {
        background = '#1a1b26',
        foreground = '#c5c8c6',
        cursor_bg = '#9ee6e4',
        cursor_border = '#9ee6e4',

        tab_bar = {
            background = '#282b42',

            active_tab = {
                bg_color = '#1a1b26',
                fg_color = '#c5c8c6',
                italic = true,
            },

            inactive_tab = {
                bg_color = '#282b42',
                fg_color = '#c5c8c6',
            },

            new_tab = {
                bg_color = '#282b42',
                fg_color = '#c5c8c6',
            },
        },

        ansi = {
            "black",
            "#cc6666",
            "#adff2f",
            "#f0c674",
            "#6495ed",
            "#b294bb",
            "#afeeee",
            "#c5c8c6"
        },

        brights = {
            "#445d66",
            "#cc6666",
            "#adff2f",
            "#f0c674",
            "#6495ed",
            "#b294bb",
            "#afeeee",
            "#c5c8c6"
        },
    },

    -- https://wezfurlong.org/wezterm/config/appearance.html
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,

    -- https://wezfurlong.org/wezterm/config/lua/config/audible_bell.html
    audible_bell = 'Disabled',

    -- https://wezfurlong.org/wezterm/config/lua/config/check_for_updates.html
    check_for_updates = false,

    -- https://wezfurlong.org/wezterm/config/lua/config/cursor_blink_rate.html
    cursor_blink_rate = 500,

    -- https://wezfurlong.org/wezterm/config/lua/config/default_cursor_style.html
    default_cursor_style = 'BlinkingBlock',

    -- https://wezfurlong.org/wezterm/config/lua/config/enable_wayland.html
    enable_wayland = true,

    -- https://wezfurlong.org/wezterm/config/lua/config/exit_behavior.html
    exit_behavior = 'Close',

    -- https://wezfurlong.org/wezterm/config/lua/config/window_padding.html
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
}

