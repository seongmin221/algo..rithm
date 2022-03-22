import sys

s = []

def push(_):
    s.append(_)

def pop():
    if s:
        print(s.pop())
    else:
        print(-1)

def size():
    print(len(s))

def empty():
    if s:
        print(0)
    else:
        print(1)

def top():
    if s:
        print(s[-1])
    else:
        print(-1)

def input(com, i):
    if com == "push":
        push(i)
    elif com == "pop":
        pop()
    elif com == "size":
        size()
    elif com == "empty":
        empty()
    elif com == "top":
        top()


n = int(sys.stdin.readline())
i = []
for k in range(n):
    i.append(list(sys.stdin.readline().split()))
for k in i:
    if k[0] == "push":
        input(k[0], k[1])
    else:
        input(k[0], 0)