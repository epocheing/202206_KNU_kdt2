# 헤더 확인하기

import csv

f = open("../Data/gender.csv", encoding="euc_kr")
data = csv.reader(f)

header = next(data)

for i in range(len(header)):
    print("{0:4d}: {1}".format(i, header[i]), end=", ")

    if (i + 1) % 5 == 0:
        print()

f.close()
