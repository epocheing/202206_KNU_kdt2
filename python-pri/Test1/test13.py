# 기능 : 문자열 리스트를 입력받아서 오름차순 결과 낮은 문자열과 높은 문자열 출력
# 함수명 : msgList
# 파라미터 : 가변 리스트
# 결과값 : 오름차순 높은것, 낮은것

def msgList(*msg):
    msg = list(msg)
    msg.sort()
    print(f'가장 낮은 문자열은 {msg[0]}이고 가장 높은 문자열은 {msg[-1]}입니다')
