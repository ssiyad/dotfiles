from qutebrowser.api import interceptor
from qutebrowser.qt.core import QUrl, QUrlQuery


def old_reddit(request: interceptor.Request):
    if request.request_url.host() == "www.reddit.com":
        request.request_url.setHost("old.reddit.com")
        request.redirect(request.request_url)


def hckrnws(request: interceptor.Request):
    if (
        request.request_url.host() == "news.ycombinator.com"
        and request.request_url.path() == "/item"
    ):
        query = QUrlQuery(request.request_url)
        item_id = query.queryItemValue("id")
        if item_id:
            new_url = QUrl(f"https://www.hckrnws.com/stories/{item_id}")
            request.redirect(new_url)


interceptor.register(old_reddit)
interceptor.register(hckrnws)
