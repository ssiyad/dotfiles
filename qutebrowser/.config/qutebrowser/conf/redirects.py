from qutebrowser.api import interceptor
from qutebrowser.qt.core import QUrl, QUrlQuery


def old_reddit(request: interceptor.Request):
    if not request.request_url.host() == "www.reddit.com":
        return
    try:
        request.request_url.setHost("old.reddit.com")
        request.redirect(request.request_url)
    except interceptor.interceptors.RedirectException:
        pass


def hckrnws(request: interceptor.Request):
    if not request.request_url.host() == "news.ycombinator.com":
        return

    path = request.request_url.path().lstrip("/")
    url: QUrl | None = None

    match path:
        case "newest":
            url = QUrl("https://www.hckrnws.com/new/1")
        case "show":
            url = QUrl("https://www.hckrnws.com/show/1")
        case "ask":
            url = QUrl("https://www.hckrnws.com/ask/1")
        case "item":
            query = QUrlQuery(request.request_url)
            id = query.queryItemValue("id")
            url = QUrl(f"https://www.hckrnws.com/stories/{id}")
        case _:
            url = QUrl("https://www.hckrnws.com/top/1")

    try:
        request.redirect(url)
    except interceptor.interceptors.RedirectException:
        pass


interceptor.register(old_reddit)
interceptor.register(hckrnws)
