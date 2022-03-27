import sys
from collections import deque

input = sys.stdin.readline

N = int(input().rstrip())
graph = [[0 for _ in range(N+2)] for _ in range(N+2)]
tmp = [[0 for _ in range(N)] for _ in range(N)]
for i in range(N):
    tmp[i] = list(map(int, sys.stdin.readline().rstrip()))
    for j in range(N):
        graph[i+1][j+1] = tmp[i][j]

# search 1
def search():
    x = 1
    for _ in range(N):
        if 1 in graph[x]:
            y = graph[x].index(1)
            return (x,y)
        else:
            x += 1
    return (-1, -1)


def explore(x,y):
    count[index] += 1
    graph[x][y] = 0
    if graph[x+1][y]:
        explore(x+1, y)
    if graph[x][y+1]:
        explore(x, y+1)
    if graph[x-1][y]:
        explore(x-1, y)
    if graph[x][y-1]:
        explore(x, y-1)

count = []
index = 0
x = 1
while True:
    x, y = search()
    if x == -1:
        break
    count.append(0)
    explore(x,y)
    index += 1

count.sort()
print(len(count))
for i in range(len(count)):
    print(count[i])