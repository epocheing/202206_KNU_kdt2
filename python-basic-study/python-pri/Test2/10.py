jul = 0
while jul <= 12:
    if jul <= 9:
        print('{0:^19}'.format('*' * (jul * 2 + 1)))
        jul += 1
    else:
        print('{0:^19}'.format('*' * 3))
        jul += 1

