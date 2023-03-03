import sys
from queue import Queue


# initial settings
N, M, V = map(int, sys.stdin.readline().split())

tmp = []
graph = [[] for _ in range(N+1)]

tmp = [list(map(int, sys.stdin.readline().split())) for _ in range(M)]
for i in tmp:
    x, y = i[0], i[1]
    graph[x].append(y)
    graph[y].append(x)
for tmp in graph:
    tmp.sort()

# BFS
queueB = Queue()
visitedB = [V]
queueB.put(V)
while not queueB.empty():
    pos = queueB.get()
    for tmp in graph[pos]:
        if tmp not in visitedB:
            queueB.put(tmp)
            visitedB.append(tmp)

# DFS
visitedD = []
def DFS(graph, start):
    visitedD.append(start)
    for tmp in graph[start]:
        if tmp not in visitedD:
            DFS(graph, tmp)

DFS(graph, V)

for tmp in visitedD:
    print(tmp, end=' ')
print('')
for tmp in visitedB:
    print(tmp, end=' ')