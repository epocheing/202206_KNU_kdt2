jul = 0
while jul <= 12:
    if jul <= 9:
        print('{0:^19}'.format("*" * (2 * jul + 1)))
        jul += 1
    else:
        print(f"{'*'* 3:^19}")
        jul += 1
