import sys

n = int(sys.stdin.readline().rstrip())
a = set(list(map(int, sys.stdin.readline().split())))
m = int(sys.stdin.readline().rstrip())
b = list(map(int, sys.stdin.readline().split()))

for i in b:
    if i in a:
        print("1")
    else:
        print("0")