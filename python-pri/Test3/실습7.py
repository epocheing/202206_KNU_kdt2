# 기능 : 입력된 문자열의 코드값을 16진수로 변환
# 함수명 : changeHex
# 파라미터 : 문자열
# 결과물 : 16진수값

def changeHex(msg):
    for i in msg:
        print(hex(ord(i)),end="")

changeHex("rrrrr")
