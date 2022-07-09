# ----------------------------------------------------------------------------
# 프로그렘: adress
# 기능 : 주소록 관리하는 프로그램
# 같은 경로에 AddressBook 폴더 생성후 파일 이름_전화번호.txt 파일로 저장
# 보기 검색 추가 종료 삭제 5가지 기능 들어가야함
# 기능을 매뉴로 표시
# 5번 누르면 종료
# -----------------------------------------------------------------------------

# 폴더 없을시 폴더 생성-----------------------------------------------------------
import os
if os.path.exists(".\\AddressBook") is False:
    os.mkdir(".\\AddressBook")

# 전역변수 선언 -- 상수, 전부다 대문자로 적어서 바꾸면 안되는 상수인걸 표현---------------
DRECTORY = ".\\AddressBook"
FILE_LIST = os.listdir(DRECTORY)

# 함수 선언---------------------------------------------------------------------
# --------------------------------------------------------------
# 매뉴 보여주는 함수
# 기능 : 매뉴 보여주기
# 함수명 : displayMenu
# 파라미터 : 없음
# 결과값 : 없음
# --------------------------------------------------------------
def displayMenu():
    print('='*3 + ' 나의 주소록' + '='*3)
    print('1. 전체보기')
    print('2. 검   색')
    print('3. 추   가')
    print('4. 삭   제')
    print('5. 종   료')
    print('='*17)

# --------------------------------------------------------------
# 전체 주소록 보여주는 함수
# 함수명 : showAll
# 기능 : Address 폴더의 파일명 보여주기
# 파라미터 : 없음
# 결과값 : 없음
# --------------------------------------------------------------
def showAll():
    for n in FILE_LIST:
        print(n[:-4])

# --------------------------------------------------------------
# 주소록 이름으로 검색 후 정보 보여주는 함수
# 함수명 : searchAddr
# 기능 : 검색 후 정보 출력 함수
# 파라미터 : 문자열(이름)
# 결과값: : 없음
# --------------------------------------------------------------
def searchAddr(name):
    for n in FILE_LIST:
        if name in n:
            print(n[:-4])
            with open(f'{DRECTORY}\\{n}', mode='r', encoding='utf-8') as f:
                print(f.read())
        pass

# --------------------------------------------------------------
# 이름 전화번호 지역 이메일 받아서 새로운 파일 추가하는 함수
# 함수명 : addAddr
# 기능 : 받은 정보 입력
# 파라미터 : str
# 결과값 : 없음
# --------------------------------------------------------------
def addAddr(msg):
    msg = str(msg).split(',')
    msglist = []
    for m in msg:
        msglist.append(m.strip())
    name, phone, reg, email = msglist
    FILENAME = name+'_'+phone
    with open(f'{DRECTORY}\\{FILENAME}.txt', mode='w', encoding='utf-8') as f:
        f.write(f'{name},{phone},{reg},{email}')
    print('주소록에 저장되었습니다.')

# --------------------------------------------------------------
# 프로그램 초기화시키는 함수
# 함수명 : reset
# 기능 : 프로그램 초기화
# 파라미터 : 없음
# 결과값 : 없음
# --------------------------------------------------------------
def reset():
    if os.path.exists(DRECTORY) is False:
        os.mkdir(DRECTORY)
    global FILE_LIST
    FILE_LIST = os.listdir(DRECTORY)
    print('\n')

# --------------------------------------------------------------
# 파일 삭제하는 함수
# 함수명 : fileDel
# 기능 : 파일 삭제
# 파라미터 : str
# 결과값 : none
# --------------------------------------------------------------
def delFile(data):
    os.remove(f'{DRECTORY}\\{data}.txt')


# 기능 구현 ---------------------------------------------------------------------

while True:
    displayMenu()

    SELC = int(input('매뉴 선택: '))

    # 5 입력시 빠져나가기
    if SELC == 5:
        reset()
        break

    # 없는 숫자 입력시
    elif SELC not in [1, 2, 3, 4, 5]:
        print('올바를 숫자를 입력해 주세요.')
        reset()

    # 1 입력시 전체보기
    elif SELC == 1:
        showAll()
        reset()

    # 2 입력시 검색하기
    elif SELC == 2:
        name = input('검색 단어: ')
        searchAddr(name)
        reset()

    # 3 입력시 자료 추가하기
    elif SELC == 3:
        info = input('이름, 전화번호, 지역, 이메일을 입력해주세요: ')
        addAddr(info)
        reset()

    # 4 입력시 자료 삭제하기
    elif SELC == 4:
        data = input('삭제할 자료명을 입력해 주세요: ')
        delFile(data)
        reset()

    pass
