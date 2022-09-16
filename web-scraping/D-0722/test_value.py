import re
from collections import deque
from urllib.request import urlopen

from bs4 import BeautifulSoup

num_deque = deque()
p = re.compile(r"\D+")
result_deque = deque()

for i in range(1, 53):
    html = "https://www.hollys.co.kr/store/korea/korStore2.do?pageNo=" + str(i) + "&sido=&gugun=&store="

    hollys_url = urlopen(html)
    hollys = BeautifulSoup(hollys_url, "html.parser")
    hollys_table = hollys.select_one("tbody")
    list = hollys_table.select("td.center_t")

    for i in range(1, 11):
        num_deque.append(list[(6 * i) - 1].text)


print(len(num_deque))
