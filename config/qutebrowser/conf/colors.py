import catppuccin

# set the flavor you'd like to use
# valid options are 'mocha', 'macchiato', 'frappe', and 'latte'
# last argument (optional, default is False): enable the plain look for the
# menu rows
catppuccin.setup(c, "mocha", True)

c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.algorithm = 'lightness-hsl'
c.colors.webpage.preferred_color_scheme = 'dark'
