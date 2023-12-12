# 기능 : 3개의 정수중 큰거 작은거 출력
# 함수명 : laSmall
# 파라미터 : num1 num2 num3
# 결과물 : 큰수 작은수

def laSmall(num1, num2, num3):
    nums = [num1, num2, num3]
    nums.sort()
    return print(f'가장 큰 값은 {nums[2]}이고 작은값은 {nums[0]}입니다.')

laSmall(5,2,88)
