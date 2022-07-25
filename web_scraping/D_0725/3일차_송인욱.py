from collections import defaultdict

import requests
from attr import attr
from bs4 import BeautifulSoup
from selenium import webdriver

html = requests.get("https://finance.naver.com/sise/sise_market_sum.naver")
soup = BeautifulSoup(html.text, "html.parser")
aa = soup.find("table", {"class", "type_2"}).find_all("a", attrs={"class": "tltle"})

for i in aa:
    print(i.text)


class Website:
    def __init__(
        self,
        name,
        url,
        meun,
    ):
        self.name = name  # 웹 사이트 이름: 네이버 금융
        self.url = url  # 웹 사이트 주소: https://finance.naver.com/
        self.menu = meun  # 웹 사이트 매뉴 : sise/sise_market_sum.naver?&page=1
        
