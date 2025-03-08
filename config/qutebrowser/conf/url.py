u = c.url

u.default_page = "https://google.com"
u.start_pages = "https://google.com"
u.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "s": "https://stackoverflow.com/search?q={}",
    "w": "https://en.wikipedia.org/wiki/Special:Search?search={}",
    "y": "https://www.youtube.com/results?search_query={}",
}
u.open_base_url = True
