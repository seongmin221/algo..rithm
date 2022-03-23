import sys
from queue import Queue

# initial settings
N = int(sys.stdin.readline().rstrip())
M = int(sys.stdin.readline().rstrip())

tmp = []
graph = [[] for _ in range(N+1)]

tmp = [list(map(int, sys.stdin.readline().split())) for _ in range(M)]
for i in tmp:
    x, y = i[0], i[1]
    graph[x].append(y)
    graph[y].append(x)
for tmp in graph:
    tmp.sort()

visitedD = []
def DFS(graph, start):
    visitedD.append(start)
    for tmp in graph[start]:
        if tmp not in visitedD:
            DFS(graph, tmp)
DFS(graph,1)
print(len(visitedD)-1)