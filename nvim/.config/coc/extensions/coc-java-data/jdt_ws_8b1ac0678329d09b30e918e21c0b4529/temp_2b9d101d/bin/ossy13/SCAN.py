#!/usr/bin/env python3


def f(a, b):
    return abs(a - b)


# lst = [53, 98, 183, 37, 122, 14, 124, 65, 67]
lst = [67, 186, 47, 9, 77, 194, 150, 10, 135, 110, 13, 125]
st = lst[0]

lst.sort()
print(lst)

st_idx = 0
for i in range(len(lst)):
    if st == lst[i]:
        st_idx = i

right1 = 2 * (199 - st)
left1 = st - lst[0]
sum1 = right1 + left1

left2 = 2 * (st - 0)
right2 = lst[-1] - st
sum2 = left2 + right2

if sum1 < sum2:
    print("->")
else:
    print("<-")


print(min(sum1, sum2) / (len(lst) - 1))
