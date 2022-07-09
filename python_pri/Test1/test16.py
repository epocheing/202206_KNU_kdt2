# 기능 : 1 이상의 자연수 n 에 대해서 약수를 구하는 함수
# 함수명 : yak
# 파라미터 : num
# 결과물 : 약수 내림차순 리스트 형태

def yak(num):
    ys = []
    for i in range(1, num + 1):
        if num % i == 0:
            ys.append(i)
            ys.sort(reverse=True)
        else:
            pass
    print(ys)

yak(100)
