from os import TMP_MAX
import sys
n, k = map(int, sys.stdin.readline().split())

tmp, tmp1, tmp2 = 1, 1, 1

if k < n/2:
    for _ in range(k):
        tmp1 = tmp1 * n
        tmp2 = tmp2 * k
        n -= 1
        k -= 1
else:
    tmp = n-k
    for _ in range(n-k):
        tmp1 = tmp1 * n
        tmp2 = tmp2 * tmp
        n -= 1
        tmp -= 1
print(int(tmp1/tmp2)%10007)