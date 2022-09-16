num = input('숫자 범위를 입력하세요(1,100): ')
num = num.split(",")
num1 = int(num[0].strip())
num2 = int(num[1].strip())
nums = list(range(num1,num2+1))

for i in nums:
    count = 0
    for n in range(1,int(i)+1):
        if i % n == 0:
            count += 1
        else:
            pass
    if count == 2:
        print(i,end=" ")
