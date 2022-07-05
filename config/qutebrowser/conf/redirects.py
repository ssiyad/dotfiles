from qutebrowser.api import interceptor

targets = {
    'www.reddit.com': 'old.reddit.com',

    # https://github.com/zedeus/nitter/wiki/Instances
    'twitter.com': 'nitter.net'
}

def rewrite(request: interceptor.Request):
    if request.request_url.host() in targets:
        request.request_url.setHost(targets[request.request_url.host()])
        try:
            request.redirect(request.request_url)
        except interceptor.interceptors.RedirectException:
            pass

interceptor.register(rewrite)

