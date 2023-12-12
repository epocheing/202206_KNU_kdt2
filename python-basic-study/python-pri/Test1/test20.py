dice1 = [1, 2, 3, 4, 5, 6]
dice2 = [1, 2, 3, 4, 5, 6]
for d1 in range(1,7):
    for d2 in range(1,7):
        if d1 % 2 == 0 and d2 % 2 == 0:
            print(f'1번: {dice1[d1 - 1]}, 2번: {dice2[d2 - 1]}',end=' ')
            if dice1[d1 - 1] > dice2[d2 - 1]:
                print('1번이 이겼습니다.')
            elif dice1[d1 - 1] < dice2[d2 - 1]:
                print('2번이 이겼습니다.')
            else:
                print('비겼습니다.')
        elif d1 % 2 != 0 and d2 % 2 != 0:
            print(f'1번: {dice1[d1 - 1]}, 2번: {dice2[d2 - 1]}',end=' ')
            if dice1[d1 - 1] > dice2[d2 - 1]:
                print('1번이 이겼습니다.')
            elif dice1[d1 - 1] < dice2[d2 - 1]:
                print('2번이 이겼습니다.')
            else:
                print('비겼습니다.')
        else:
            pass





