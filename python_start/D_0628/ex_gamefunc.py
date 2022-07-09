nickName = ''
level = 0
score = 0
ranking = 0

nickName2 = ''
level2 = 0
score2 = 0
ranking2 = 0


# -----------------------------------------------
# 게임하는 사람의 정보 입력 받기
# 함 수 명 : setPlayer
# 파라미터 : 없음
# 반 환 값 : 없음
# -----------------------------------------------
def setPlayer():
    nickName = input('닉네임: ')
    level = 0
    score = 0
    ranking = 0

# -----------------------------------------------
# 매뉴 출력하기
# 함 수 명 : displayMenu
# 파라미터 : 없음
# 반 환 값 : 없음
# -----------------------------------------------
def displayMenu():
    print('''1. 회원가입
2. 게임시작
3. 랭킹보기
4. 종료
    ''')

# 프로그램 코드 -----------------------------------
while True:
    displayMenu()
    select = int(input('메뉴 선택: '))
    if select == 4:
        break

    elif select == 1:
        setPlayer()

