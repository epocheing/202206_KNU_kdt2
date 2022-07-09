msg = input('영단어를 입력하세요: ')
num = len(msg)
half = int(num / 2)
result = 0
for i in range(half):
    if msg[i] != msg[-i-1]:
        result += 1
    else:
        pass
if result > 0:
    print(1)
else:
    print(0)
