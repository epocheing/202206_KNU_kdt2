# 기능 : 점수에 맞는 학점 알려줌
# 함수명 : grade
# 파라미터 : 점수
# 결과값 : 학점

def grade(jum):
    if jum >= 90:
        hak = 'A'
    elif jum >= 80:
        hak = 'B'
    elif jum >= 70:
        hak = 'C'
    elif jum >= 60:
        hak = 'D'
    else:
        hak = 'F'
    print(f'당신의 학점은 : {hak}학점')

grade(77)
