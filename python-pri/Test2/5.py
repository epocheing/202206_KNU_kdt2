mon = int(input('월을 입력하세요: '))
if 3 <= mon <= 5:
    print('봄입니다')
elif 6 <= mon <= 8:
    print('여름입니다')
elif 9 <= mon <= 11:
    print('가을입니다')
elif mon == 12 or 1 <= mon <= 2:
    print('겨울입니다')
else:
    print('잘못된 데이터입니다')
