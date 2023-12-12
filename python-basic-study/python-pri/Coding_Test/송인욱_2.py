# 기능 : 문자열을 입력하면 utf-8로 인코딩된 값을 출력하는 함수
# 함수명 : utf
# 파라미터 : 문자열
# 결과물 : 16진수 코드값, 2진수 코드값

def utf(msg):
    hexn = ""
    binn = ""
    for n in msg:
        n = ord(n)
        hn = hex(n)
        hexn  += hn
        bn = bin(n)
        binn += bn
    print(f'{msg}의 인코딩: {hexn}')
    print(f'{msg}의 인코딩: {binn}')

utf("가나다")