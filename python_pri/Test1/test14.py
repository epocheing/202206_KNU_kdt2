# 기능 : 대소문자 서로 변환
# 함수명 : change
# 파라미터 : msg
# 결과값 : 대소문자 변환된 문자

def change(msg):
    msg = str(msg)
    num = len(msg)
    msgList = list(msg)
    for n in range(0, num):
        if msgList[n].isupper() == True:
            msgList[n] = msgList[n].lower()
        else:
            msgList[n] = msgList[n].upper()
    print("".join(msgList))

change('WEwww')
