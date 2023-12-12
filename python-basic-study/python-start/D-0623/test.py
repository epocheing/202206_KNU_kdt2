pasd = 'C:\\Users\\User\\PycharmProjects\\eee\\D_06.23\\data\\ggg.html'
pasdlist = pasd.split('\\')
print(pasdlist)
name = pasdlist[-1].split('.')[0]
print(name)
new = pasdlist[0:-1]
new = '\\'.join(new)
print(new)

