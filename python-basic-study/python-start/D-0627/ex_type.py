# ------------------------------------------------------------------
# 파이썬에서 미리 제공하는 클래스
# => 숫자 문자 저장할수 있는 클래스
# => int, str, bool, list ...
# ------------------------------------------------------------------

num = 12
# num.to_bytes()  # 클래스 안에 있는 함수 > 메서드
year = 2022
month = 6

# ------------------------------------------------------------------
# 내 프로그램, 프로젝트 에서 데이터를 저장하는 클래스
# 사용자 정의 클래스
# ------------------------------------------------------------------
# 생성 방법
# class 클래스명
#       변수 => 클래스가 나타내는 성질
#       메서드 => 클래스의 역할 기능
# => 클래스를 생성한것이지 메모리에 데이터를 저장한것은 아님
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# 계산기 프로그램 만들려고함
# => 계산기 데이터 타입 클래스
#   => 사칙 연산기능 => 기능 => 함수
#   => 숫자 데이터 => 변수
# 클래스명 : clac
# 변   수 : num1, num2
# 메 서 드 : plus, minus, multi, div
# -------------------------------------------------------------------

class clac:

    # 객체 생성자(Construct) => 객체 호출시 생성되는 메서드
    # 파이썬에서 클래스 생성시에 자주 사용되는 메서드를 기본적으로 제공
    # def __...__
    # __init__() = 객체 생성시 변수 초기화하는 경우 사용함
    def __init__(self, num1=0, num2=0):
        print('__init__')
        self.num1 = num1
        self.num2 = num2


    # 클래스의 기능에 해당하는 메서드
    def plus(self,num1, num2):
        print(self.num1 + self.num2)

    def minus(self, num1, num2):
        print(num1 - num2)

    def multi(self, num1, num2):
        print(num1 * num2)

    def div(self, num1, num2):
        print(num1 / num2)

# 클래스 사용하기 ==> 메모리에 데이터를 저장함 = 힙에 객체 생성
#              ==> 클래스명()
myclac = clac(0, 0)
yourclac = clac(0, 0)
print(f'type myclac = {type(myclac)}')

# 클래스 안에있는 데이터에 접근
myclac.num1 = 12
myclac.num2 = 5
myclac.plus()
myclac.plus()
myclac.minus(5, 2)
yourclac.plus()

