import csv
import platform
import re

import matplotlib.pyplot as plt


def parse_city_name(city):
    """행정구역명애서 도시 이름 파싱

    Args:
        city (str): 행정구역명

    Returns:
        str: 도시 이름
    """
    city_name = re.split("[()]", city)
    return city_name[0]


def draw_piechart(city_name, city_population, voting_population):
    """전체 인구수 대비 투표 가능 인구의 파이차트 작성

    Args:
        city_name (str): 도시 이름
        city_population (int): 도시 인구수
        voting_population (int): 투표가능 인구수
    """
    non_voting_population = city_population - voting_population
    population = [non_voting_population, voting_population]

    if platform.system() == "Windows":
        plt.rc("font", family="Malgun Gothic")
    else:
        plt.rc("font", family="AppleGothic")

    color = ["tomato", "royalblue"]

    plt.pie(population, labels=["18세 미만", "투표가능인구"], autopct="%.1f%%", colors=color, startangle=90)
    plt.legend()
    plt.title(city_name + "투표 가능 인구 비율")
    plt.show()


def get_voting_population(city):
    """투표가능 인구수 추출해서 정보와 그래프 보여주는 함수

    Args:
        city (str): 도시명
    """
    f = open("../Data/age.csv", encoding="euc_kr")
    data = csv.reader(f)
    next(data)

    city_name = ""
    city_population = 0
    voting_population = 0

    for row in data:
        if city in row[0]:
            city_population = row[1]
            if "," in city_population:
                city_population = city_population.replace(",", "")
            city_population = int(city_population)

            city_name = parse_city_name(row[0])

            for data in row[21:]:
                if "," in data:
                    data = data.replace(",", "")
                voting_num = int(data)
                voting_population += voting_num
            break  # 첫번째 row만 빼내기 위해서 사용, 위치 주의
    f.close()
    print(f"{city_name} 전체 인구수 {city_population:,}명, 투표 가능 인구수: {voting_population:,}")
    draw_piechart(city_name, city_population, voting_population)


get_voting_population("대구광역시")
