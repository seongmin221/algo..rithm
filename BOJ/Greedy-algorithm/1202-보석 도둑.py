import sys

n, k = map(int, sys.stdin.readline().split())

j = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
c = [int(sys.stdin.readline()) for _ in range(n)]
j.sort()
c.sort()
print(j, c)