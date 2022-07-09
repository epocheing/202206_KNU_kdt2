# -------------------------------------------------------------
# 상속(Inheritance) => 기존 클래스의 모든 것을 가져가다 사용
# 표현 : class 클래스명( 클래스명 ) :
# -------------------------------------------------------------
import cmath


class A:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def displayInfo(self):
        print(f'A = {self.x}, {self.y}')


class B(A):
    def clac(self):
        print(f'{self.x} * {self.y} = {self.x * self.y}')


class C(B):
    def add(self):
        print(self.x + self.y)

    # 부모 클래스에 있는 기능 수정하고 싶을때 => 오버라이딩(overriding)
    def clac(self):
        print(self.x * self.y, self.x - self.y, self.x / self.y, self.x + self.y)


b = B(5, 3)
b.displayInfo()
b.clac()

c = C(1,2)
c.add()
c.clac()
