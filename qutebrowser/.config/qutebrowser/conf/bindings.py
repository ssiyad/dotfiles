config.bind(
    "\\\\",
    "spawn --userscript qute-pass --mode gopass",
)
config.bind(
    "\\u",
    "spawn --userscript qute-pass --mode gopass --username-only",
)
config.bind(
    "\\p",
    "spawn --userscript qute-pass --mode gopass --password-only",
)
config.bind(
    "\\o",
    "spawn --userscript qute-pass --mode gopass --otp-only",
)

# Media
config.bind("pv", "hint links spawn --detach mpv {hint-url}")
