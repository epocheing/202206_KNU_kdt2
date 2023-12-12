# --------------------------------------------------
# 변수의 동작 범위 (scope)
# 전역변수 (global variable)
#       파일 안에서 프로그렘 실행시 메모리에 생성
#       프로그렘 종료시 메모리에서 삭제
#       파일안에 모든곳에서 사용 가능한 변수
# 지역변수 (local varialbe)
#       함수 실행시 메모리에서 실행
#       함수 종료시에 메모리에서 삭제
#       함수 안에서만 사용가능한 변수
# --------------------------------------------------
year = 2022
msg = 'Happy Weekend!'
money = 1000

def testvar(num):
    # global year # 전역변수 사용한다는 알림
    year = 3000
    print(num)
    print(year)
    print(msg)

def output():
    print(f'현재 잔고 : {money}')

def inputmoney():
    global money
    money = money+800

inputmoney()
inputmoney()
output()

testvar(1000)
print(f'year = {year}')
# print(f'num = {num}') # 함수 안에 존재하는 지역변수는 사용 불가


print(1, 20, 30)
print(1, 20, 30, sep='-*_*_*_*-')
print(1, 20, 30, end=' 줄바꿈 ')
print(1)
