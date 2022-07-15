import csv
import matplotlib.pyplot as plt
import platform

f = open("../Data/subwaytime.csv", encoding="utf-8")
data = csv.reader(f)
next(data)
next(data)

line_list = [str(n) + "호선" for n in range(1, 8)]
max_station = [""] * len(line_list)
max_number = [0] * len(line_list)

for row in data:
    if row[1] in line_list:
        line_index = int(row[1][0]) - 1
        if max_number[line_index] < int(row[11]) + int(row[13]):
            max_number[line_index] = int(row[11]) + int(row[13])
            max_station[line_index] = row[3]
f.close()

for i in range(7):
    print(
        f"출근 시간대 {line_list[i]} 최대 하차역은 {max_station[i]}역이고 하차인원은 {max_number[i]:,}명 입니다"
    )

if platform.system() == "Windows":
    plt.rc("font", family="Malgun Gothic")
else:
    plt.rc("font", family="AppleGothic")

x_ticks = []
for i in range(7):
    result = line_list[i] + ": " + max_station[i]
    x_ticks.append(result)

plt.figure(dpi=200)
plt.bar(range(7), max_number)
plt.xticks(range(7), x_ticks, rotation=80)
plt.title("출근 시간대 지하철 노선별 최대 하차 인원 및 하차역")
plt.show()
