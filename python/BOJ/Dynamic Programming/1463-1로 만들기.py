import sys
from collections import deque
N = int(sys.stdin.readline().rstrip())
result = deque([N])
count = 0
while 1 not in result:
    print(result)
    for _ in range(len(result)):
        tmp = result.popleft()
        if tmp % 3 == 0:
            result.append(tmp/3)
        if tmp % 2 == 0:
            result.append(tmp/2)
        result.append(tmp-1)
    count += 1
print(count)