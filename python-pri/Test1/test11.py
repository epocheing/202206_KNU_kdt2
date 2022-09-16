num = int(input('숫자를 입력하세요: '))
fibo = [0, 1]
if num >= 2:
    for i in range(2, num+1):
        new = fibo[i-2] + fibo[i-1]
        fibo.append(new)
    print(fibo[num])
else:
    print(fibo[num])
