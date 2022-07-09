data = {
    'N20123': ['홍길동', '합격'], 'N20124': ['이철수', '합격'], 'N20125': ['이나영', '불합격'],
    'N20126': ['김민우', '대기'], 'N20127': ['박보민', '불합격'], 'N20128': ['이나영', '합격'],
    'N20129': ['김지은','대기']
}
print(data)
print(list(data.items()))

# 기능 : 이름과 번호 입력하여 결과 보여주는 함수
# 함수명 : searchRe
# 파라미터 : 이름, 번호
# 결과물 : 검색 결과

def searchRe(name, num):
    result = data[num][1] if name == data[num][0] else '올바른 값을 입력해주세요'
    return result

# 기능 : 결과를 입력하면 그에 해당하는 이름과 번호를 출력해주는 검색함수
# 함수명 : searchN
# 파라미터 : 결과값
# 결과물 : 이름(번호)

def searchN(result):
    nrList = list(data.values())
    numList = list(data.keys())
    name = []
    num = []
    for i in enumerate(nrList):
        if i[1][1] == result:
            name.append(i[1][0])
            num.append(numList[i[0]])
        else:
            pass
    for v in range(len(name)):
        print(f'{name[v]}({num[v]})',end=" ")

searchN('합격')
