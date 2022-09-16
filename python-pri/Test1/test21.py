num = int(input('동전 종류 개수: '))
var = input('동전 종류: ')
mon = int(input('거스름 금액: '))

var = var.split()
var.sort(reverse=True)

count = 0
while mon == 0:

