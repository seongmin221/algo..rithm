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