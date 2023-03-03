import sys, heapq

n = int(sys.stdin.readline().rstrip())
mh = []
k = []
for i in range(n):
    k.append(int(sys.stdin.readline().rstrip()))

for i in k:
    if i == 0 and len(mh) != 0:
        print(-heapq.heappop(mh))
    elif i == 0 and len(mh) == 0:
        print(0)
    else:
        heapq.heappush(mh, -i)
