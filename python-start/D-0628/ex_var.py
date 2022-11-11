# -----------------------------------------------------------------
# 변수의 스코프(Scop)
# - 지역변수 (Local Vartiable) : 함수에서만 사용, 파라미터, 함수안에 변수
# - 전역변수 (Global Variable) : 파이썬 파일 안에 있는 변수
#                               같은 파이썬 파일 안에 있는 함수에서 사용 가능
# -----------------------------------------------------------------
isGame = False    # 게임 진행 여부 저장 변수
SELEC = 0

# 게임 시작을 알리는 함수
def startGame():
    global isGame
    isGame = True
    print('*** 게 임 시 작 ***')


# 게임 종료하는 함수
def gameStop():
    global isGame
    isGame = False
    print('*** 게 임 종 료 ***')


# 게임 화면을 드로잉하는 함수
# 게임중일때는 => 게임 화면
# 게임중아닐때는 => 대기화면
def drawGame():
    global isGame
    if isGame is True:
        print('***************************')
        print('**                       **')
        print('**      ㅇㅇㅇㅇㅇㅇ       **')
        print('**                       **')
        print('***************************')
    else:
        print('***************************')
        print('**                       **')
        print('**         준비중         **')
        print('**                       **')
        print('***************************')

# -------------------------------------------

drawGame()
startGame()
drawGame()
