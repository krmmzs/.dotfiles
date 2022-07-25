#!/usr/bin/env python3


def f(a, b):
    return abs(a - b)


# lst = [98, 183, 37, 122, 14, 124, 65, 67]

lst = [186, 47, 9, 77, 194, 150, 10, 135, 110, 13, 125]

flag = []
sum = 0
# now = 53
now = 67
for i in range(len(lst)):
    min, min_idx = 10000, -1
    for j in range(len(lst)):
        if lst[j] in flag:
            continue
        t = f(lst[j], now)
        if t < min:
            min, min_idx = t, j
    flag.append(lst[min_idx])
    print(lst[min_idx])
    now = lst[min_idx]
    sum += min

print(sum / (len(lst)))
