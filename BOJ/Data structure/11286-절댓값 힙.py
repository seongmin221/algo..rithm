# import sys, heapq

# n = int(sys.stdin.readline().rstrip())
# ah = []
# sign = []
# k = []

# def pop_abs():
#     if len(ah) == 1:
#         print(heapq.heappop(ah))
#     elif ah[0] == ah[1]:
#         print(-1 * heapq.heappop(ah))
#     else:
#         print(heapq.heappop(ah))

# for i in range(n):
#     k.append(int(sys.stdin.readline().rstrip()))

# for i in k:
#     if i < 0:
#         heapq.heappush(ah, abs(i))
#         sign.insert(ah.index(abs(i)), -1)
#     elif i > 0:
#         heapq.heappush(i)
#         sign.insert(ah.index(abs(i)), 1)
#     elif i == 0 and len(ah) != 0:
#         pop_abs()
#     else:
#         print(0)
        
# import sys, heapq

# mh = []
# k = []
# for i in range(n):
#     k.append(int(sys.stdin.readline().rstrip()))

# for i in k:
#     if i == 0 and len(mh) != 0:
#         print(heapq.heappop(mh))
#     elif i == 0 and len(mh) == 0:
#         print(0)
#     else:
#         heapq.heappush(mh, i)

# max heap
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

