S = input('숫자를 입력해 주세요(예: 123,42,98,18): ')
S = S.split(',')
num = len(S)
count = 0
for i in range(num):
    count += int(S[i])
print(count)
