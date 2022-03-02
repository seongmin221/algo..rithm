# ( 는 +1로, ) 는 -1로 해서 
# 첫 문자열부터 끝까지 더할때 0보다 작은 순간이 없고,
# 마지막에 합이 0이면 YES 아니면 NO

import sys

t = int(sys.stdin.readline())
n = []

for k in range(t):
    n.append(list(sys.stdin.readline().rstrip()))

def switch(_):
    if _ == "(":
        return 1
    elif _ == ")":
        return -1

for k in n:
    s = 0
    for i in k:
        s += switch(i)
        if s < 0:
            print('NO')
            break
    if s == 0:
        print('YES')
    elif s > 0:
        print('NO')