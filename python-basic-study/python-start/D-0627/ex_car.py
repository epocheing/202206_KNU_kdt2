# ---------------------------------------------------------
# 현대자동차를 표현하는 데이터 타입 즉 class 생성
# 클래스명 : car
# 속성/특징 : 제조사, 차번호, 차종류, 색상
#           -> 클래스 변수 :
#           -> 인스턴스 변수 :
# 역할/기능 : 이동한다, 정지한다, 차정보 출력 한다
#           -> 이동한다 => 0000번 자동차가 xx 에서 xx로 간다.
#           -> 정지한다 => 0000번 자동차를 xxx에 정지시켰다.
#           -> 차정보 출력 => 제조사, 차종류, 차번호
# ---------------------------------------------------------
class car:
    maker = '현대자동차'

    def __init__(self, number, model, color):
        self.number = number
        self.model = model
        self.color = color

    def move(self, fr, to):
        print(f'{self.number}번 {self.model}자동차가 {fr}에서 {to}로 간다.')

    def stop(self, where):
        print(f'{self.number}번 자동차를 {where}에 정지시켰다.')

    def carInfo(self):
        print(f'제조사 = {car.maker}')
        print(f'차종류 = {self.model}')
        print(f'차번호 = {self.number}')
        print(f'색깔 = {self.color}')


car1 = car(1111, '소나타', '회색')
car2 = car(1234, '제네시스', '은갈치')

car1.carInfo()
car2.move('대전', '대구')
car1.stop('1층 주차장')
car2.carInfo()

# car 데이터 10개 저장
cars = []
for n in range(10):
    cars.append(car(n * 1000, 'suv', 'red'))

for car in cars:
    car.carInfo()
