import sys
input = sys.stdin.readline

A = int(input().rstrip()) # 원소 개수
a = set(map(int, input().rstrip().split()))
a = sorted(a)

# print(a)
b = len(a)
step = 0
for i in range(b-1):
    for j in range(b-2)
