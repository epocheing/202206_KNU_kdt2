import csv
import platform

import matplotlib.font_manager as fm
import matplotlib.pyplot as plt


def print_population(population: list):
    """특정지역의 인구 현황을 화면에 출력함

    Args:
        population (list): 인구 리스트
    """
    for i in range(len(population)):
        print("{0:3d}세: {1:4d}명".format(i, population[i]), end="")
        if (i + 1) % 10 == 0:
            print()


def draw_gender_population(male_num_list, female_num_list):
    if platform.system() == "Windows":
        font_name = fm.FontProperties(fname=r"C:\Windows\Fonts\malgun.ttf").get_name()
        plt.rc("font", family=font_name)
    else:
        plt.rc("font", family="AppleGothic")

    plt.barh(range(len(male_num_list)), male_num_list, label="남성")
    plt.barh(range(len(female_num_list)), female_num_list, label="여성")
    plt.rcParams["axes.unicode_minus"] = False
    plt.legend()
    plt.show()


def calculate_population():
    f = open("../Data/gender.csv", encoding="euc_kr")
    data = csv.reader(f)
    male_num_list = []
    female_num_list = []

    district = input("지역(동) 이름을 입력하세요: ")
    for row in data:
        if district in row[0]:
            for male in row[106:207]:
                if "," in male:
                    male = male.replace(",", "")
                male_num_list.append(-int(male))

            for female in row[209:310]:
                if "," in female:
                    female = female.replace(",", "")
                female_num_list.append(int(female))
    f.close()
    print("남성 총 인구수: ", sum(male_num_list))
    print_population(male_num_list)
    print("--------------------------------------")
    print("여성 총 인구수: ", female_num_list)
    print_population(female_num_list)
    draw_gender_population(male_num_list, female_num_list)


calculate_population()
