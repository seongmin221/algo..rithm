import sys

N = int(sys.stdin.readline().rstrip())
count = [0 for _ in range(N+1)]
for i in range(N+1):
    if i == 1:
        count[i] = 9
    elif i == 2:
        count[i] = 17
    else:
        count[i] = (count[i-1]-2) * 2 + 2
print(count[N])