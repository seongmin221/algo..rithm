import sys
n, k = map(int, sys.stdin.readline().split())

dp = [[1 for _ in range(1001)] for _ in range(1001)]
def binominal(n, k):
    for i in range(1,n+1):
        for j in range(1, n+1):
            if i == j or i == 1:
                dp[i][j] = 1
            else:
                dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
    print(dp[n][k]%10007)
binominal(n,k)
    