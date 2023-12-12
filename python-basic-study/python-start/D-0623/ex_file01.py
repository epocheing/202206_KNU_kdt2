# -------------------------------------------------------------------------------------
# 파일 읽고 쓰기 = 입출력
# -------------------------------------------------------------------------------------
filename = 'mydata.txt'

# 파일 쓰기
# 파일 열기
# 모드 'w' = 파일 없으면 생성 후 쓰기, 파일 있으면 내용 지우고 쓰기
file = open(filename, mode='w', encoding='utf-8')

# 모드 'a' = append 약자
#         = 파일 없으면 생성 후 쓰기
#         = 파일 있으면 이어 쓰기
# file = open(filename, mode='a', encoding='utf-8')

# 데이터 쓰기
file.write('Good\n')
file.write('Day\n')
file.write('Commando\n')

# 파일 닫기
file.close()

# 파일 읽기
# 모드 'r' = rear 약자, 기본값
file = open(filename,mode='r')

# 파일 전체 데이터 가져오기
data = file.read()
print(data)

file.seek(0)
data2 = file.read()
print(data2, len(data2))

# 파일 포인트 제일 앞으로
file.seek(0)

# 파일에서 한줄 읽기
data3 = file.readline()
print(f'file.readline() = {data3}')
data3 = file.readline()
print(f'file.readline() = {data3}')
data3 = file.readline()
print(f'file.readline() = {data3}')
data3 = file.readline()
print(f'file.readline() = {data3}')
file.seek(0)

# 한줄씩 읽어서 리스트에 담아서 가져오기
data4 = file.readlines()
print(f'file.readlines = {data4}')
file.seek(0)

# 특정한 문자만 가져오고 싶을때
data5 = file.read(2)
print(data5)

# 파일 닫기
file.close()

