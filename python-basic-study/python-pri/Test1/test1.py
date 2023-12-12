num = int(input('숫자를 입력해 주세요. '))
num = str(num).strip()
syg = int(num.count('3')) + int(num.count('6')) + int(num.count('9'))
if syg > 0:
    print('X' * syg)
elif num == "100":
    for n in range(1,101):
        n = str(n).strip()
        sygn = int(n.count('3')) + int(n.count('6')) + int(n.count('9'))
        if sygn > 0:
            print('X' * sygn, end=" ")
        else:
            print(n, end=" ")
else:
    print(num)
