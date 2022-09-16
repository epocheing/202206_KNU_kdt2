import csv
import platform
import re

import matplotlib.pyplot as plt

# 기초 설정
f = open("../Data/age.csv", encoding="euc_kr")
data = csv.reader(f)
result = []
city = ""

# 데이터 추출
for row in data:
    if "신암1" in row[0]:
        str_list = re.split("[()]", row[0])  # 정규 표현식 사용하여 분리
        city = str_list[0]
        for data in row[3:]:
            if "," in data:  # 숫자에 , 들어가있는것 방지
                data.replace(",", "")
            result.append(int(data))
f.close()

# 폰트 설정
if platform.system() == "Windows":
    plt.rc("font", family="Malgun Gothic")
else:
    plt.re("font", family="AppleGothic")

# 그래프 그리기
plt.title(f"{city} 인구현황")
plt.xlabel("나이")
plt.ylabel("인구 수")
plt.style.use("ggplot")
plt.plot(result)
plt.show()
