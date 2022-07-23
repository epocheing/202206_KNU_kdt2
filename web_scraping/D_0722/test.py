ss = True
a = 1


def test(flag):
    global a
    print(a)
    if a == 5:
        flag = False
        return flag
    else:
        a += 1
        flag = True
        return flag


while ss:
    print("---진행중---")
    test(ss)
    if test(ss) is False:
        break
