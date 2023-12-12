ms = int(input('밀리세컨드를 입력하세요: '))
s = ms / 1000
h = s // 3600
m = (s % 3600) // 60
rs = s % 60

print(f'{h}시 {m}분 {rs}초')
