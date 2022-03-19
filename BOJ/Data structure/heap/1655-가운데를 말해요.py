import sys, heapq

n = int(sys.stdin.readline().rstrip())
lh = [] # maxheap
rh = [] # minheap
for i in range(n):
    x = int(sys.stdin.readline().rstrip())
    if len(lh) == len(rh): heapq.heappush(lh, -x)
    else: heapq.heappush(rh, x)
    if len(lh) != 0 and len(rh) != 0:
        if -lh[0] > rh[0]:
            lhr = -heapq.heappop(lh)
            rhr = heapq.heappop(rh)
            heapq.heappush(lh, -rhr)
            heapq.heappush(rh, lhr)
    print(-lh[0])