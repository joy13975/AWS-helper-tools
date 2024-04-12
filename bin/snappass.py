import requests
from html.parser import HTMLParser


class InputValueExtractor(HTMLParser):
    def __init__(self):
        super().__init__()
        self.value = None

    def handle_starttag(self, tag, attrs):
        if tag == "input":
            for attr in attrs:
                if attr[0] == "id" and attr[1] == "password-link":
                    for attr in attrs:
                        if attr[0] == "value":
                            self.value = attr[1]


def get_snappass_url(secret, ttl="Week"):
    url = "https://snappass.herokuapp.com/"
    headers = {
        "content-type": "application/x-www-form-urlencoded",
    }
    data = {
        "password": secret,
        "ttl": ttl
    }

    response = requests.post(url, headers=headers, data=data)
    parser = InputValueExtractor()
    parser.feed(response.text)
    return parser.value
