import csv
import platform

import matplotlib.pyplot as plt


def draw_mult_pie(gu_list, male_list, female_list):
    if platform.system() == 'Windows':
        path = r'c:\Windows\Fonts\malgun.ttf'
    elif platform.system() == 'Darwin': # Mac OS
        path = r'/System/Library/Fonts/AppleGothic'
    else:
        path = r'/usr/share/fonts/truetype/name/NanumMyeongjo.ttf'

    fig, axes = plt.subplots(2, 4, figsize=(15, 8), dpi=100)
    fig.suptitle("대구광역시 구별 남녀 인구 비율", fontsize=15)
    subplot_list = [241, 242, 243, 244, 245, 246, 247, 248]
    for i in range(8):
        plt.subplot(subplot_list[i])
        plt.pie([male_list[i], female_list[i]], labels=["남성", "여성"], autopct="%.1f%%", startangle=90)
        plt.title(f"대구광역시 {gu_list[i]}")
    plt.show()


def Daegu_Gu_Gender_pop():
    f = open("../Data/gender.csv", encoding="euc_kr")
    data = csv.reader(f)

    gu_list = ["중구", "동구", "서구", "남구", "북구", "수성구", "달서구"]
    male_list = []
    female_list = []

    for row in data:
        if "대구광역시" in row[0]:
            total_male = int(row[104].replace(",", ""))
            total_female = int(row[207].replace(",", ""))
            break

    for gu in gu_list:
        for row in data:
            if "대구광역시" in row[0]:
                if gu in row[0]:
                    male_list.append(int(row[104].replace(",", "")))
                    female_list.append(int(row[207].replace(",", "")))
                    break
    f.close()

    male_list.append(total_male)
    female_list.append(total_female)
    gu_list.append("전체")

    draw_mult_pie(gu_list, male_list, female_list)


Daegu_Gu_Gender_pop()
