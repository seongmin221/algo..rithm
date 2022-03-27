import sys
from collections import deque
input = sys.stdin.readline

N = int(input().rstrip())
w = deque(list(map(int, input().rstrip().split()))) # 추
M = int(input().rstrip())
m = deque(list(map(int, input().rstrip().split()))) # 구슬
for _ in range(M):
    

# print(N, w, M, m)