defalt = ['가나다_1234', '나다라_2345', '다라마_3456']
while True:
    print("""
=== 나의 주소록 ===
1. 전체보기
2. 검   색
3. 추   가
4. 종   료
=================
    """)
    num = int(input('메뉴 선택: '))

    # 파일 경로
    file = '.\\AddressBook'

    # 다른 숫자 입력했을때
    if num not in [1, 2, 3, 4]:
        print('올바를 숫자를 입력해 주세요.')

    # 4 입력했을때 반복문 빠져나가기
    elif num == 4:
        break

    # 파일 추가하기
    elif num == 3:
        data = input("정보 입력: ")
        # 입력값 , 로 나눔
        dlist = data.split(',')
        # 입력값 공백 제거
        dlists = []
        for n in dlist:
            n = n.strip()
            dlists.append(n)
        data = ",".join(dlists)
        fName = dlists[0] + '_' + dlists[1]
        with open(f'.\\AddressBook\\{fName}.txt', mode='w', encoding='utf-8') as f:
            f.write(data)
        # 전체보기를 위해서 defalt리스트에 저장
        defalt.append(fName)
        print('주소록에 저장되었습니다.')

    # 전체 보기
    elif num == 1:
        for i in defalt:
            print(i)

    # 이름으로 검색하기
    elif num == 2:
        find = input('검색 단어: ')
        # 이름만 따로 빼서 리스트로 만들기
        name = []
        for n in defalt:
            name.append(n.split('_')[0])
        # 이름 리스트의 인덱스 = defalt 리스트의 인덱스
        le = name.index(find)
        filename = defalt[le]
        # 파일에서 내용 빼서 공백으로 다시 붙이기
        with open(f'{file}\\{filename}.txt', mode='r', encoding='utf-8') as ff:
            info = ff.read()
        info = info.split(',')
        result = " ".join(info)
        print(result)

# 한번만 실행할때는 문제 없으나 종료 후 다시 실행할 때 defalt 값에 추가된 txt파일이 반영될수 없음
# 모듈 사용하지 않고 파일명을 불러오는 방법이 있나
