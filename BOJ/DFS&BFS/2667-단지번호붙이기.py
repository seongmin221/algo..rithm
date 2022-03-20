from re import S
import sys
from queue import Queue

N = int(sys.stdin.readline().rstrip())
graph = [[0 for _ in range(N+2)] for _ in range(N+2)]
tmp = [[0 for _ in range(N)] for _ in range(N)]
for i in range(N):
    tmp[i] = list(map(int, sys.stdin.readline().rstrip()))
    for j in range(N):
        graph[i+1][j+1] = tmp[i][j] 

# (x,y)는 1인 포인트를 찾아서 입력값으로 넣기
c = []
def explore(x, y):
    graph[x][y] = 0
    global count
    count += 1
    if graph[x+1][y]:
        explore(x+1, y)
    if graph[x][y+1]:
        explore(x, y+1)
    if graph[x-1][y]:
        explore(x-1, y)
    if graph[x][y-1]:
        explore(x, y-1)

def findInit(graph): 
    global count
    for i in range(N):
        if 1 in graph[i]:
            count = 0
            j = graph[i].index(1)
            explore(i,j)
            c.append(count)
            
findInit(graph)
print(len(c))
c.sort()
for i in range(len(c)):
    print(c[i])