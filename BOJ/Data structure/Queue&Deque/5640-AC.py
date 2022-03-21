import sys
from collections import deque

T = int(sys.stdin.readline().rstrip())
op = []
count = []
test = []
for _ in range(T):
    op.append(sys.stdin.readline().rstrip())
    count.append(sys.stdin.readline().rstrip())
    tmp = sys.stdin.readline().rstrip(']\n').lstrip('[').split(',')
    if '' in tmp:
        test.append(deque([]))
    else:
        test.append(deque(map(int, tmp)))
    
for i in range(T):
    for j in range(len(op[i])):
        if op[i][j] == 'D':
            if len(test[i]) != 0:
                test[i].popleft()
            else:
                print('error')
                break
        elif op[i][j] == 'R':
            test[i].reverse()
    if test[i]:
        out = list(test[i])
        print(out)    

