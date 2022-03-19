import sys, heapq

n = int(sys.stdin.readline().rstrip())

ph = []
nh = []
k = []
for i in range(n):
    k.append(int(sys.stdin.readline().rstrip()))

for i in k:
    nlen = len(nh)
    plen = len(ph)
    if i < 0:
        heapq.heappush(nh, -i)
    elif i > 0:
        heapq.heappush(ph, i)
    elif i == 0 and nlen + plen != 0:
        if plen == 0:
            print(-1*heapq.heappop(nh))
        elif nlen == 0:
            print(heapq.heappop(ph))
        elif nh[0] == ph[0]:
            print(-1*heapq.heappop(nh))
        elif nh[0] > ph[0]:
            print(heapq.heappop(ph))
        elif nh[0] < ph[0]:
            print(-1*heapq.heappop(nh))
    else:
        print(0)

