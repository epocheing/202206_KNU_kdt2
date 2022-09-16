# 기능 : 숫자와 콤마로만 이루어진 문자열 data에서 모든 수의 합과 가장 작은수, 큰수 출력
# 함수명 : intInfo
# 파라미터 : 문자열
# 결과믈 : 합, 큰수, 작은수

def intInfo(data):
    numlist = []
    sum = 0
    for i in data:
        if i != ',':
            numlist.append(i)
    for n in numlist:
        sum += int(n)
    numlist.sort()
    large = numlist[-1]
    small = numlist[0]

    print(f"{data}의 합 : {sum}, 가장 큰 수 : {large}, 가장 작은 수 : {small}")

data = '222,1,34,89'
intInfo(data)



