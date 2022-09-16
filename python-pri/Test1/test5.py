mon = int(input('월의 숫자를 입력하세요: '))
if 3 <= mon <= 5:
    print('지금은 봄입니다.')
elif 6 <= mon <= 8:
    print('지금은 여름입니다.')
elif 9 <= mon <= 11:
    print('지금은 가을입니다.')
elif 1 <= mon <= 2 or mon == 12:
    print('지금은 겨울입니다.')
else:
    print('올바른 숫자를 입력해주세요.')

print
