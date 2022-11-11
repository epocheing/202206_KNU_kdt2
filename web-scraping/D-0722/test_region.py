import re
from urllib.request import urlopen

from bs4 import BeautifulSoup

result = []

for i in range(53, 70):
    html = "https://www.hollys.co.kr/store/korea/korStore2.do?pageNo=" + str(i) + "&sido=&gugun=&store="

    hollys_url = urlopen(html)
    hollys = BeautifulSoup(hollys_url, "html.parser")

    p_region = re.compile(r"\w{2}\s\w+\s?\w?(?=[<]/td)")

    hollys_region = hollys.find("tbody").find_all("td", {"class": "noline"})
    # for j in hollys_region:
    #     print(j)
    #     print("------------------------------")

    for i in hollys_region:
        i = str(i)
        m = p_region.search(i)
        if m is not None:
            print(m.group())
        else:
            break
