# 기능 : 문자열 입력하면 utf08, 2진수로 인코딩된 값 출력하는 함수
# 함수명 : utfBi
# 파라미터 : 문자열
# 결과값 : 2진수 코드

def utfBi(msg):
    msg = list(msg)
    for m in msg:
        result = bin(ord(m))
        print(result,end="")

utfBi("가나다")
