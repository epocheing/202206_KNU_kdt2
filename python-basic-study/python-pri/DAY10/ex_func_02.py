# --------------------------------------------------
# 함수 반환값인 return
# 함수, 조건문, 반복문과 함께 사용
# 원래 있던 곳으로 다시 돌아가는 기능
# --------------------------------------------------

def getAdd(num1=5, num2=0):
    return num1+num2

def noData():
    print('nodata 입니다')
    return

print(getAdd())
print(noData())

# --------------------------------------------------
# 사칙연산 하는 함수
# 기능 : 사칙연산 수행결과 반환하는 함수
# 함수명 : caFour
# 인자 : num1, num2
# 반환값 : 덧셈, 뺄셈, 곱셈, 나눗셈 결과
# --------------------------------------------------
def caFour(num1, num2):
    return num1+num2, num1-num2, num1*num2, num1/num2 if num2>0 else 'none'

print(caFour(4, 0))
