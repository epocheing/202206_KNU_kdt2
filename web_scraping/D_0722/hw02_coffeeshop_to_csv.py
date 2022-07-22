import re
from collections import defaultdict
from email.policy import default
from urllib.error import HTTPError
from urllib.request import urlopen

import pandas as pd
from bs4 import BeautifulSoup

df_datas = defaultdict(list)

a = 1
while True:
    html = (
        "https://www.hollys.co.kr/store/korea/korStore2.do?pageNo="
        + str(a)
        + "&sido=&gugun=&store="
    )

    hollys_url = urlopen(html)
    hollys = BeautifulSoup(hollys_url, "html.parser")
    hollys_table = hollys.select_one("tbody")

    p_name = re.compile(r"(^\w+[점]$|.+[페]$)")
    p_region = re.compile(r"^\w{2}\s\w*\s?\w*$")
    p_locate = re.compile(r"\D+\s\w*\s\w+\s.*")
    p_number = re.compile(r"(^\d{2,4}[-]\d{3,4}[-]\d*$|^[.]$|^[없][음]$|^[x]$)")

    compile_list = [p_name, p_region, p_locate, p_number]
    columns_list = ["매장이름", "위치(시,구)", "주소", "전화번호"]

    for p in compile_list:
        index = compile_list.index(p)
        data_list = hollys_table.find_all(text=p)
        column = columns_list[index]

        for i in data_list:
            df_datas[column].append(i)

    if df_datas["매장이름"][-1] == "등록된 지점이 없습니다.":
        df_datas["매장이름"].remove("등록된 지점이 없습니다.")
        break

    if a == 54:
        break

    a += 1

print(len(df_datas["매장이름"]))
print(len(df_datas["위치(시,구)"]))
print(len(df_datas["주소"]))
print(len(df_datas["전화번호"]))
