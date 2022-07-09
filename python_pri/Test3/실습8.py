# 기능 : 구매한 상품명과 가격으로 총 구매 금액 계산
# 함수명 : money
# 파라미터: 구매상품, 가격 dict
# 결과물 : 총 구매 금액

def money(**mp):
    if mp is None:
        print('구매한 상품 없음')
    else:
        mpl = list(mp.values())
        sum = 0
        for i in range(0,len(mpl)):
            sum += int(mpl[i])
        print(f'총 구매 금액 : {sum}')

money(tv=20000,운동화=10000)
money()
