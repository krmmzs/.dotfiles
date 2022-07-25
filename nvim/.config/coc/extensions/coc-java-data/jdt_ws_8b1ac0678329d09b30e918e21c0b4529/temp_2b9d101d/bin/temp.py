s1 = [1, 2, 3]
s2 = s1
print(s1 is s2)
s2.extend([5, 6])
print(s1[4])
s1.append([-1, 0, 1])
print(s2[5])
s3 = s2[:]
s3.insert(3, s2.pop(3))
print(len(s1))
print(s1[4] is s3[6])
print(s3[s2[4][1]])
print(s1[:3] is s2[:3])
print(s1[:3] == s2[:3])
