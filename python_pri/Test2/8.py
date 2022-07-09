nums = input('숫자와 콤마를 입력해 주세요: ')
nums = nums.split(',')
sum = 0
for n in nums:
    sum += int(n)
print(sum)
