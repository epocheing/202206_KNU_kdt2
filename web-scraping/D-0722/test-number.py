import re
from urllib.request import urlopen

import pandas as pd
from bs4 import BeautifulSoup

result = []

for i in range(1, 54):
    html = "https://www.hollys.co.kr/store/korea/korStore2.do?pageNo=" + str(i) + "&sido=&gugun=&store="

    hollys_url = urlopen(html)
    hollys = BeautifulSoup(hollys_url, "html.parser")

    p_number = re.compile(
        r"(\d{0,4}[-]?[)]?\s?\d{2,4}[-]?\s?\d{4}\s?(?=[<]))|(t\"></td>)|(?<=[>])[.](?=[<])|(?<=[>])[없][음](?=[<])|(?<=[>])[xX](?=[<])"
    )

    hollys_table = hollys.find("tbody").find_all("td", {"class": "center_t"})

    for i in hollys_table:
        i = str(i)
        m = p_number.search(i)
        if m is not None:
            if m.group() == 't"></td>':
                result.append(".")
            else:
                result.append(m.group())


result = pd.DataFrame(result)
result.to_csv("test.csv", header=False)
