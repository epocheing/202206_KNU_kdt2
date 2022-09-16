# 기능 : 문자열 리스트 입력받아 내림차순결과 가장 높은 문자열과 낮은 문자열 구하는 함수
# 함수명 : decenStr
# 파라미터 : 문자열 리스트
# 결과물 : 정렬결과, 가장 높은 문자열, 낮은 문자열

def decenStr(msg):
    msg.sort(reverse=True)
    print(f'정렬 결과 : {msg}')
    print(f'가장 높은 문자열 : {msg[0]}, 가장 낮은 문자열 : {msg[-1]}')

msg = ['zero','child', 'apple', 'Zoo', 'Good', 'Flower']
decenStr(msg)
