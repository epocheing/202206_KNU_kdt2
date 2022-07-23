import re
from collections import defaultdict
from urllib.request import urlopen

import pandas as pd
from bs4 import BeautifulSoup


def make_df_datas(dictData: defaultdict, htmlList: list, compi, column, index=False):
    """DF에 들어갈 defaltdict 만들어주는 함수

    Args:
        dictData (defaultdict): list defalt
        htmlList (list): 찾을 html 리스트
        compi (_type_): compile patter
        column (_type_): defalt dict key value
        index (bool, optional): 없는 값 찾는 기준 설정. Defaults to False.

    Returns:
        bool: index 설정시 값 없을때 False 반환
    """
    for i in htmlList:
        i = str(i)
        m = compi.search(i)
        if index is False:
            if m is not None:
                if m.group() == 't"></td>':  # t"></td> = 비어있는 값
                    dictData[column].append(".")
                else:
                    dictData[column].append(m.group())
        else:
            if m is not None:
                if m.group() == 't"></td>':
                    dictData[column].append(".")
                else:
                    dictData[column].append(m.group())
                return True
            else:
                return False


def get_df_datas(a=1):
    """df에 들어갈 Dict 데이터 반환

    Args:
        a (int, optional): start page. Defaults to 1.

    Returns:
        Dict: hollys datas
    """
    countinue = True
    df_datas = defaultdict(list)
    while countinue:
        html = "https://www.hollys.co.kr/store/korea/korStore2.do?pageNo=" + str(a) + "&sido=&gugun=&store="

        hollys_url = urlopen(html)
        hollys = BeautifulSoup(hollys_url, "html.parser")

        p_name = re.compile(r"\w+([점]|[페])(?=[<]/a)")
        p_region = re.compile(r"\w{2}\s\w+\s?\w?(?=[<]/td)")
        p_locate = re.compile(r"(?<=[>])\w+\s\w+\s.*(?=[<]/a)")
        p_number = re.compile(
            r"((?<=[>]).*\d{2,4}[-]?\s?\d{4}\s?(?=[<]/td))|(t\"></td>$)|(?<=[>])[.](?=[<])|(?<=[>])[없][음](?=[<])|(?<=[>])[xX](?=[<])"
        )

        p_list = [p_name, p_region, p_locate, p_number]
        columns = ["매장이름", "위치(시,구)", "주소", "전화번호"]

        hollys_table = hollys.find("tbody").find_all("td", {"class": "center_t"})
        hollys_region = hollys.find("tbody").find_all("td", {"class": "noline"})

        for p in p_list:
            column = columns[p_list.index(p)]
            if p != p_region:
                make_df_datas(df_datas, hollys_table, p, column)
            else:
                countinue = make_df_datas(df_datas, hollys_region, p, column, index=True)  # 위치(시,구)를 index로 설정하고 값이 없을때 False 반환해서 break
        a += 1
    return df_datas


print(get_df_datas(50))
