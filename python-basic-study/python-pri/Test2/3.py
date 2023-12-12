money = int(input('현재 가지고있는 금액을 입력하세요: '))
price = int(input('구매한 제품 가격을 입력하세요: '))

if price > money:
    print('구매할수 없습니다')
else:
    gus = money - price
    print(f'거스름돈은 {gus} 원 입니다.')
    print(f'거스름돈으로 오천원 지폐는 {gus//5000}장, 천원 지폐는 {(gus%5000)//1000}장 받았습니다')
