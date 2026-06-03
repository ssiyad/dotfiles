config.bind(
    "\\\\",
    "spawn --userscript qute-pass --mode gopass --password-store ~/.local/share/gopass/stores/root",
)
config.bind(
    "\\u",
    "spawn --userscript qute-pass --mode gopass --password-store ~/.local/share/gopass/stores/root --username-only",
)
config.bind(
    "\\p",
    "spawn --userscript qute-pass --mode gopass --password-store ~/.local/share/gopass/stores/root --password-only",
)
config.bind(
    "\\o",
    "spawn --userscript qute-pass --mode gopass --password-store ~/.local/share/gopass/stores/root --otp-only",
)

# Media
config.bind("pv", "hint links spawn --detach mpv {hint-url}")
