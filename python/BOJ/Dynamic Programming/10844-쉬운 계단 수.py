import sys

N = int(sys.stdin.readline().rstrip())
count = [[0 for _ in range(10)] for _ in range(N+1)]

count[1][0] = 0
for j in range(1, 10):
    count[1][j] = 1
for i in range(2, N+1):
    count[i][0] = count[i-1][1]
    count[i][9] = count[i-1][8]
    for j in range(1, 9):
        count[i][j] = count[i-1][j-1] + count[i-1][j+1]
print(sum(count[N])%1000000000)