# 기능 : 입력받은 정수에 대한 약수 출력 함수
# 함수명 : yak
# 파라미터 : num
# 결과물 : 약수들

def yak(num):
    nums = []
    for i in range(1,num + 1):
        if num % i == 0:
            nums.append(str(i))
        else:
            pass
    print(' '.join(nums))

yak(8)
