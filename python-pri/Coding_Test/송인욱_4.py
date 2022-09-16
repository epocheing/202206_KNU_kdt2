num = input('게임 정수 입력: ')

tfe = int(num.count('2')) + int(num.count('4')) + int(num.count('8'))
if num != '100':
    if tfe > 0:
        print('#' * tfe)
    else:
        print(num)
elif num == '1000':
    for n in range(1,int(num)+1):
        ns = str(n)
        tfes = int(ns.count('2'))+int(ns.count('4')) + int(ns.count('8'))
        if tfes > 0:
            n = tfes * '#'
        print(n,end='')