import time as t


print(f'time = {t.time()}')
print(f'time.localtime = {t.localtime(t.time())}')
print(f'time.asctime = {t.asctime(t.localtime(t.time()))}')

time = t.strftime('%c', t.localtime(t.time()))

print(time)

# for num in range(30):
#     t.sleep(0.07)
#     print(num, end='')

import  random

def lotto(game):
    count = 0
    while count < game:
        numset = set([])

        while len(numset) < 7:              # 랜덤 난수 6개 생성 후 numset에 더함
            num = random.randint(1, 50)
            numset.add(num)

        count += 1

        numset = list(numset)
        numset.sort()

        print(numset)

lotto(5)
