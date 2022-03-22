import sys
from collections import deque

T = int(sys.stdin.readline().rstrip())
op = []
count = []
for i in range(T):
    flag = 0
    reverse = False
    op = sys.stdin.readline().rstrip()
    count = int(sys.stdin.readline().rstrip())
    test = deque(sys.stdin.readline().rstrip()[1:-1].split(','))
    if count == 0:
        test = deque()
    for p in op:
        if p == 'R':
            reverse = not reverse
        elif p == 'D':
            if test:
                if not reverse:
                    test.popleft() 
                else:
                    test.pop()
            else:
                print('error')
                flag = 1
                break
    if flag == 0:
        if not reverse:
            print('['+','.join(test)+']')
        else:
            test.reverse()
            print('['+','.join(test)+']')