import csv
import platform
import re

import matplotlib.font_manager as fm
import matplotlib.pyplot as plt


def parse_district_name(district):
    """'행정구역' 명칭에서 숫자부분 제거함

    Args:
        district (str): 행정구역
    """
    district_name = re.split("[()]", district)
    return district_name[0]


def print_population(population: list):
    """특정지역의 인구 현황을 화면에 출력함

    Args:
        population (list): 인구 리스트
    """
    for i in range(len(population)):
        print("{0:3d}세: {1:4d}명".format(i, population[i]), end="")
        if (i + 1) % 10 == 0:
            print()


def draw_population(district_name, population_list):
    """특정 지역에 대한 인구 분포를 그래프로 나타냄(plot)

    Args:
        district_name (str): 지역 이름
        population_list (list): 인구 리스트
    """
    if platform.system() == "Windows":
        font_name = fm.FontProperties(fname=r"C:\Windows\Fonts\malgun.ttf").get_name()
        plt.rc("font", family=font_name)
    else:
        plt.rc("font", family="AppleGothic")

    plt.style.use("ggplot")
    plt.title(f"{district_name} 인구 현황")
    plt.xlabel("나이")
    plt.ylabel("인구수")

    plt.bar(range(101), population_list)
    plt.xticks(range(0, 101, 10))
    plt.plot(population_list)
    plt.show()


def get_population(district):
    f = open("../Data/age.csv", encoding="euc_kr")
    data = csv.reader(f)
    next(data)

    population_list = []
    full_district_name = ""
    for row in data:
        if district in row[0]:
            full_district_name = parse_district_name(row[0])
            for data in row[3:]:
                if "," in data:
                    data.replace(",", "")
                population_list.append(int(data))
    f.close()

    print_population(population_list)
    draw_population(full_district_name, population_list)


get_population("신암1")
