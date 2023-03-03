import sys
from collections import deque

N = int(sys.stdin.readline().rstrip())
cards = deque([ i+1 for i in range(N) ])

for _ in range(N-1):
    cards.popleft()
    if len(cards) == 1:
        break
    tmp1 = cards.popleft()
    cards.append(tmp1)

print(cards.pop())