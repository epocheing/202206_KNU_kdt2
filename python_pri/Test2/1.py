num = int(input('숫자를 입력하세요: '))
snum = str(num)
syg = int(snum.count('3') + snum.count('6') + snum.count('9'))
if num != 100:
    if syg > 0:
        print('*' * syg)
    elif syg == 0:
        print(num)
else:
    for i in range(1,101):
        sygs = int(str(i).count('3') + str(i).count('6') + str(i).count('9'))
        if sygs > 0:
            i = '*' * sygs
        else:
            i = i
        print(i,end=" ")


