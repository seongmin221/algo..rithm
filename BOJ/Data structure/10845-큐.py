import sys

n = int(sys.stdin.readline().rstrip())
o = []
for i in range(n):
    o.append(list(sys.stdin.readline().split()))

q = []
def push(i):
    q.append(i)

def pop():
    if q:
        print(q.pop(0))
    else:
        print(-1)

def size():
    print(len(q))

def empty():
    if q:
        print(0)
    else:
        print(1)

def front():
    if q:
        print(q[0])
    else:
        print(-1)

def back():
    if q:
        print(q[len(q)-1])
    else:
        print(-1)

for op in o:
    if op[0] == 'push':
        push(op[1])
    elif op[0] == 'pop':
        pop()
    elif op[0] == 'size':
        size()
    elif op[0] == 'empty':
        empty()
    elif op[0] == 'front':
        front()
    elif op[0] == 'back':
        back()