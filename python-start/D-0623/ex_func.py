# -------------------------------------------------------------------------------------
# 함수 (function) : 자주 사용되는 기능을 묶어서 이름 붙여놓은것
# 코드 재사용을 위해서 사용함
# 형태
# def 함수명(재료, ...):
#   코드
#   코드
#   return 결과
# -------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------
# 기 능: 숫자 두개 더한 후 결과 돌려주는 기능
# 함수명: addTwo
# 파라미터: num1, num2
# 반환값: 더한값
# -------------------------------------------------------------------------------------


def addTwo(num1=0, num2=0):
    """
    숫자 두개 더한 후 결과 반환
    :param num1: int
    :param num2: int
    :return: int
    """
    value = num1 + num2
    return value


# 함수 사용하기 - 함수 호출
value = addTwo(12, 23)

# 화면에 출력하기 - print
print(value)


# -------------------------------------------------------------------------------------
# 기능: 문자 두개 더하는 기능의 함수
# 함수명: addStr
# 파라미터: str1, str2
# 반환값: 문자 더한 값
# -------------------------------------------------------------------------------------


def addStr(str1, str2):
    """
    문자 두개 더한 후 결과값 반환
    :param str1:  str
    :param str2:  str
    :return: str
    """
    value = str1 + str2 if type(str1) == str and type(str2) == str else "문자를 입력해주세요."
    return value
    # 결과값을 변수에 저장하지 말고 바로 return으로 반환해도 가능함


result = addStr(23, "ff")
print(result)


# -------------------------------------------------------------------------------------
# 기능: 원하는 단의 구구단을 출력하는 기능의 함수
# 함수명: gugu
# 파라미터: num
# 반환값: 없음 ( 출력하기 떄문 )
# -------------------------------------------------------------------------------------


def gugu(num):
    """
    숫자에 해당하는 구구단
    :param num: int
    :return: 구구단
    """
    if 0 < num < 10:
        print(f"{num}단")
        for n in range(1, 10):
            print(f"{num} * {n} = {num * n}")
    else:
        print("1 ~ 9 사이의 숫자를 입력하세요.")


def listGugu(num):
    gList = []
    for i in range(1, 10):
        gList.append(i * num)
    return gList


def strGugu(num):
    gStr = str(num)
    i = 2


gugu(8)

gg = listGugu(3)
print(gg)
ggg = strGugu(3)
print(ggg)

# 인자를 여러개 할때, 튜플타입으로 받아옴


def addNum(*nums):
    total = 0
    for num in nums:
        total += num
    return total


print(addNum())
print(addNum(1, 2, 3, 4, 5))

# 키워드 파라미터: 키와 값이 유동적으로 들어오는 형태, Dict 타입
# 기능: 평균 구하는 함수
# 함수명: getAvg
# 파라미터: 과목명, 점수 유동적 => **subject
# 결과값: 점수의 평균 --- int


def getAvg(**subject):
    print(f"{subject}의 타입: {type(subject)}")
    jum = subject.values()
    total = 0
    for i in jum:
        total += i
    Avg = total / len(jum) if len(jum) != 0 else "0으로 나눌수 없음"
    return Avg


print(getAvg(국어=10, 수학=20, 영어=30))
# 키워드 파라미터의 키는 문자만 가능, 따옴표 필요없이 =으로 적음
print(getAvg())

print(addTwo())


# -------------------------------------------------------------------------------------
# 함수의 데이터 타입 알아보기
# -------------------------------------------------------------------------------------

print(type(addTwo), id(addTwo))

list = [addTwo, addStr]
print(list[0](3, 5))

# -------------------------------------------------------------------------------------
# 익명함수 Lambda
# def 하기에는 짧지만 간단하게 사용하고 싶을때
# -------------------------------------------------------------------------------------

add = lambda a, b: a + b
print(add(1, 2))
