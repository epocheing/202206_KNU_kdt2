mon = int(input('좋아하는 월 입력 : '))

eng = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'july', 'agus', 'sep', 'oct', 'nov', 'dec']
if 3<= mon <= 5:
    print(f'{eng[mon-1]} Spring')
elif 6 <= mon <= 8:
    print(f'{eng[mon-1]} Summer')
elif 9 <= mon <= 11:
    print(f'{eng[mon-1]} Atum')
elif mon == 12 or 1<= mon <= 2:
    print(f'{eng[mon-1]} Winter')
else:
    print('존재하지 않는 월입니다')
