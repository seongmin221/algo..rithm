import sys

e = sys.stdin.readline()
e_n = [_ for _ in e.split('-')]
a = []
for i in e_n:
    a.append(sum(map(int, i.split('+'))))
s = a.pop(0) - sum(a)

print(s)


# n = [int(_) for _ in re.split('[+-]', e)]
# print(n)