import datetime
import random
import re
from urllib.request import urlopen

from bs4 import BeautifulSoup

# ---------------------------------------------
# 재귀 함수 사용
# ---------------------------------------------


pages = set()  # 세트 선언


def getLinks(pageUrl):
    global pages
    html = urlopen("https://en.wikipedia.org{}".format(pageUrl))
    bs = BeautifulSoup(html, "html.parser")
    for link in bs.find_all("a", href=re.compile("^(/wiki/)")):
        if "href" in link.attrs:
            if link.attrs["href"] not in pages:
                newPage = link.attrs["href"]
                print("-" * 20)
                print(newPage)
                pages.add(newPage)
                getLinks(newPage)


getLinks("/wiki/Kevin_Bacon")
