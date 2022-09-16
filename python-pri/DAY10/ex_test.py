# 두개 문자를 입력받아서 하나의 문자열로 반환하는 함수
# 입력 -> Good, Luck
# 출력 -> Good Luck
# 함수명    : joinStr
# 파라미터  : str1, str2
# 반환값    : 합쳐진 문자열

# def joinStr(str1, str2):
#    return str1 + ' ' + str2
# datas = input('문자열 두개 입력하세요 (A,B): ')
# datas = datas.split(',')
# datas[0] = datas[0].strip()
# datas[1] = datas[1].strip()
# datas = [a.strip() for a in datas]

# print(joinStr(datas[0], datas[1]))


# 숫자 데이터 리스트를 입력 받아서 평균을 반환하는 함수
# nums = [1,9,23,81,4]
# 출력 = 평균 xx.xxx
# 함수명 : thatAvg
# 파라미터 : 리스트
# 반환값 : 평균값

def thatavg(nums):
    count = len(nums)
    total = 0

    for num in nums:
        total = total + num

    return total / count if count > 0 else "값을 입력하시오."


rr = []
print(f'평균 {thatavg(rr)}')


# 입력받은 정수의 code값을 16진수로 반환하는 함수
# 단 입력되는 정수의 갯수는 유동적
# 입력 => 2, 3 출력 =. 0x32, 0x33
# 함수이름 : getCode
# 파라미터 : num
# 반환값 : 16진수

def getcode(*num):
    code = ord(str(*num))
    return hex(code)



