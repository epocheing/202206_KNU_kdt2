# ------------------------------------------------------------------------------
# pass (경로)
# 절대 경로 : 파일 및 폴더 존재하는 위치의 경로를 말함 C:\Users\User\Documents\R
# 상대 경로 : 현재 코드파일 기준으로 경로를 지정하는 것
# .  : 현재위치
# .. : 상위 (한단계 위)
# ------------------------------------------------------------------------------

file = '../data/form.html'
file = 'data/form.html'

# form.html 파일을 라인단위로 읽어서 화면에 출력
# 파일 열기
file = open(file, mode='r')

# 한줄씩 리스트에 담아서 출력하기
data = file.readlines()
print(data)
for i in data:
    if len(i) > 0:
        print(f'line data = {i.strip()}')

# 커서 처음으로 돌리기
file.seek(0)
print('\n')

# while 문 활용해서 출력하기
while True:
    data = file.readline()
    if not data:
        break
    if len(data) > 0:
        print(f'line data = {data.strip()}')

# 파일 닫기
file.close()

# with as 구문 사용해서 파일 읽고 쓰기
with open("mydata.txt", mode='r', encoding='utf-8') as file:
    file.read()

