import sys

T = int(sys.stdin.readline().rstrip())
count = [[0, 0] for _ in range(41)]
for _ in range(T):
    N = int(sys.stdin.readline().rstrip())
    for i in range(N+1):
        if i == 0:
            count[i][0] = 1
            count[i][1] = 0
        elif i == 1:
            count[i][0] = 0
            count[i][1] = 1
        else:
            count[i][0] = count[i-1][0] + count[i-2][0]
            count[i][1] = count[i-1][1] + count[i-2][1]
    print(count[N][0], count[N][1])