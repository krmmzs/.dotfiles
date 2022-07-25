#!/usr/bin/env python3


def f(a, b):
    return abs(a - b)


# lst = [53, 98, 183, 37, 122, 14, 124, 65, 67]
lst = [67, 186, 47, 9, 77, 194, 150, 10, 135, 110, 13, 125]

sum = 0
for i in range(len(lst) - 1):
    sum += f(lst[i + 1], lst[i])

print(sum)
print(sum / (len(lst) - 1))
