# 기능 : 원하는 단수의 구구단 출력
# 함수명 : gugu
# 파라미터 : 단수
# 결과물 : 원하는 단수의 구구단

dan = int(input('알고 싶은 단 입력: '))

def gugu():
    global dan
    for i in range(1,10):
        print(f'{dan} * {i} = {dan * i}')


gugu()
