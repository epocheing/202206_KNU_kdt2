import re
from urllib.request import urlopen

from bs4 import BeautifulSoup

html = urlopen("https://en.wikipedia.org/wiki/Kevin_Bacon")
bs = BeautifulSoup(html, "html.parser")

# a 태그에 대한 모든것 가져옴
# url_links = bs.find_all("a")
# print("kevin 링크 수:", len(url_links))
# 링크 갯수 확인

# for link in bs.find_all("a"):
#     if "href" in link.attrs:
#         print(link.attrs["href"])
# 링크 전부 출력

body_content = bs.find("div", {"id": "bodyContent"})
pattern = "^(/wiki/)((?!:).)*$"

for link in body_content.find_all("a", href=re.compile(pattern)):
    if "href" in link.attrs:
        print(link.attrs["href"])
