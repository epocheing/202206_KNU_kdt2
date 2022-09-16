nums = input('숫자 범위를 입력하세요(예.1~500): ')
nums = nums.split('~')
num1 = int(nums[0])
num2 = int(nums[1])
nums = list(range(num1,num2+1))

primeList = []
for n in nums:
    yak = 0
    for i in range(1,n+1):
        if n % i == 0:
            yak += 1
        else:
            pass
    if yak == 2:
        primeList.append(n)

print(primeList)
