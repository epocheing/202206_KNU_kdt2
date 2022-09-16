# -------------------------------------------------------------------
# 피이썬에서 미리 만들어서 제공하는 클래스
# int, float, bool, str, list, tuple, dict, set
# -------------------------------------------------------------------

num = 123  # 실제로는 생성자 실행
num2 = int(123)

name1 = '송인욱'  # 실제로는 생성자 실행
name2 = str('송인욱')


print(num, num2)
print(name1, name2)

# --------------------------------------------------------------------
# 내가 만드는 클래스 -> 평면에 좌표값을 지정하는 데이터
# 클래스명 : point
# 속성/ 특정/ 변수 : x, y
# 역할/ 가능/ 함수 :
# - Point클래스로 메모리에 존재하는 객체(인스턴스) 생성하는 메서드 __init__(self, x, y)
# - 객체(인스턴스)의 값을 읽어주는 메서드 => get속성명()
# - 객체(인스턴스)의 값을 변경해주는 메서드 => set속성명(새로운값)
# - 내가 원하는 기능, 메서드
# --------------------------------------------------------------------


class Point:
    # point instance를 생성하는 메서드
    def __init__(self, x, y):
        self._x = x
        self.y = y

    # point 인스턴스에 저장된 속성(변수)값 읽어오는 메서드 = getter 메서드
    def getX(self):
        return self._x

    def getY(self):
        return self.y

    def getXY(self):
        return self._x, self.y

    # 포인트 인스턴스에 저장된 속성(변수)값 변경하는 메서드 = setter 메서드
    def setX(self, _x):
        self.x = _x

    def setY(self, y):
        self.y = y

    def setXY(self, _x, y):
        self._x = _x
        self.y = y

    # 내가 원하는 기능의 메서드
    # Point 인스턴스의 정보 출력하는 메서드
    def showPointInfo(self):
        print(f'현재 좌표값 : {self._x, self.y}')

    # Point 인스턴스에 해당하는 좌표를 그리는 메서드
    # x값 => 가로로 이동, y값 => 다음줄 \n
    def drawPoint(self):
        if self.y > 0: print('\n' * self.y,end='')
        print(' ' * self._x + '*',end='')



p1 = Point(10, 5)
print(p1.getX())
p1.setXY(6,3)
print(p1.getXY())
p1.showPointInfo()
p1.drawPoint()

nums = [2, 4, 6, 47, 5, 7, 2]
points = [Point(10,10), Point(1,3), Point(2,7)]

points[0].drawPoint()
points[1].setY(5)
print('\n')
print(points[1].getXY())
