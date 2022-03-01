import sys

n = int(sys.stdin.readline())
s = 0
a = list(map(int, sys.stdin.readline().split()))
b = list(map(int, sys.stdin.readline().split()))
a.sort()
for _ in range(n):
    s += a[_] * b.pop(b.index(max(b)))
print(s)
