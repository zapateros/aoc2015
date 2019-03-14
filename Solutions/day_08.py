t = open('input_day_08.txt')
count_1 = 0
count_2 = 0
for k in t:
    count_1 += len(k[:-1]) - len(eval(k))
    count_2 += 2+k.count('\\')+k.count('"')
print(count_1)
print(count_2)
