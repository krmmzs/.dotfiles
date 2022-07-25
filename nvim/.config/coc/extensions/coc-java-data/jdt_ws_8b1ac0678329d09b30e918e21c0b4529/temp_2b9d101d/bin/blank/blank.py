#!/usr/bin/env python3


with open("./start.txt", "r") as f:
    s = f.read()

res = ""
with open("./end.txt", "w") as f:
    for str in s:
        if str != " ":
            res += str

    f.write(res)
