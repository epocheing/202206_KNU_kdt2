# 기능 : 입력된 문자열에서 숫자만 출력
# 함수명 : printNum
# 파라미터 : 문자열
# 결과물 : 숫자

def printNum(msg):
    le = len(msg)
    for i in range(0, le):
        if str(msg[i]).isdecimal() == True:
            print(msg[i],end=" ")
        else:
            pass

printNum('가나다라 00023')
