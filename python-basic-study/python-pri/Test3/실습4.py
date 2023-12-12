# 기능 : 다섯명 점수의 합과 평균을 구해주는 함수
# 함수명 : sumAvg
# 파라미터 : 점수 5개
# 결과물 : 합계, 평균


def sumAvg(j1, j2, j3, j4, j5):
    sum = j1 + j2 + j3 + j4 + j5
    avg = sum / 5
    print("5명 점수 합계 {0}점, 평균 {1}".format(sum, avg))

sumAvg(10,20,30,40,50)
