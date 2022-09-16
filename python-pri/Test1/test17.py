# 기능 : RLE로 변환된 값 구하는 함수
# 함수명 : rle
# 파라미터 : str 문자열
# 결과물 : rle값

def rle(msg):
    msglist = list(msg)
    msgset = set(msglist)
    msglist = list(msgset)
    msglist.sort()
    count = len(msglist)
    num = []
    for c in range(0,count):
        d = msg.count(msglist[c])
        num.append(d)
        print(f'{msglist[c]}{num[c]}',end="")

rle('aaaaabbbccdddd')

