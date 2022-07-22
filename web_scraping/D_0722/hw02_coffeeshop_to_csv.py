import re
from cgitb import reset
from collections import defaultdict
from urllib.request import urlopen

import pandas as pd
from bs4 import BeautifulSoup

df_datas = defaultdict(list)

flag = True
a = 1

while flag:
    html = "https://www.hollys.co.kr/store/korea/korStore2.do?pageNo=" + str(a) + "&sido=&gugun=&store="

    hollys_url = urlopen(html)
    hollys = BeautifulSoup(hollys_url, "html.parser")

    p_name = re.compile(r"\w+([점]|[페])(?=[<]/a)")
    p_region = re.compile(r"\w{2}\s\w+\s?\w?(?=[<]/td)")
    p_locate = re.compile(r"(?<=[>])\w+\s\w+\s.*(?=[<]/a)")
    p_number = re.compile(r"((?<=[>]).*\d{2,4}[-]?\s?\d{4}\s?(?=[<]/td))|(t\"></td>$)|(?<=[>])[.](?=[<])|(?<=[>])[없][음](?=[<])|(?<=[>])[xX](?=[<])")

    p_list = [p_name, p_region, p_locate, p_number]
    columns = ["매장이름", "위치(시,구)", "주소", "전화번호"]

    hollys_table = hollys.find("tbody").find_all("td", {"class": "center_t"})
    hollys_region = hollys.find("tbody").find_all("td", {"class": "noline"})

    for p in p_list:
        colum = columns[p_list.index(p)]

        if p == p_region:
            for i in hollys_region:
                i = str(i)
                m = p.search(i)
                if m is not None:
                    if m.group() == 't"></td>':
                        df_datas[colum].append(".")
                    else:
                        df_datas[colum].append(m.group())
                else:
                    flag = False
        else:
            for i in hollys_table:
                i = str(i)
                m = p.search(i)
                if m is not None:
                    df_datas[colum].append(m.group())
    a += 1


result = pd.DataFrame(df_datas)
result.to_csv("../Data/2일차_송인욱.csv")

# for row in range(result.shape[0]):
#     result.iloc[row]


#     print(f'[{0:3d}]: 매장이름: {1}, 지역: {2}, 주소: {3}, 전화번호: {4}'.format(row+1, ))
