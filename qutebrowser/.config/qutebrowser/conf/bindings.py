# b = config.bind
# b('pa', 'spawn --detach mpv --no-video {url}')
# b('pla', 'hint links spawn --detach mpv --no-video {hint-url}')
# b('plv', 'hint links spawn --detach mpv {hint-url}')
# b('pv', 'spawn --detach mpv {url}')

config.bind('\\\\', 'spawn --userscript qute-pass --mode gopass --password-store ~/.local/share/gopass/stores/root')
config.bind('\\u', 'spawn --userscript qute-pass --mode gopass --password-store ~/.local/share/gopass/stores/root --username-only')
config.bind('\\p', 'spawn --userscript qute-pass --mode gopass --password-store ~/.local/share/gopass/stores/root --password-only')
config.bind('\\o', 'spawn --userscript qute-pass --mode gopass --password-store ~/.local/share/gopass/stores/root --otp-only')

# Media
config.bind("pv", "hint links spawn --detach mpv {hint-url}")
