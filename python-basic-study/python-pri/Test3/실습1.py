# 기능 : 한국나이 알려주는 함수
# 함수명 : korBirth
# 파라미터 : 생년월일
# 결과값 : 한국나이

def korBirth(day):
    day = day.split('.')
    age = 2022 - int(day[0]) + 1
    print(f'당신의 한국 나이는 {age}세 입니다')

korBirth('1995.07.02')
