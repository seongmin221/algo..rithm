import sys, math
input = sys.stdin.readline

N, C = map(int, input().split())
pos = []
for i in range(N):
    pos.append(int(input().rstrip()))
pos = sorted(pos)

min_gap = 1
max_gap = pos[-1]-pos[0]
result = 0
while(max_gap >= min_gap):
    mid_gap = (min_gap + max_gap) // 2
    start = pos[0]
    cnt = 1
    for i in range(1, len(pos)):
        if pos[i] - start >= mid_gap:
            start += pos[i]
            cnt += 1
    if cnt < C:
        max_gap = mid_gap - 1
    else:
        min_gap = mid_gap + 1
        result = mid_gap

print(result)