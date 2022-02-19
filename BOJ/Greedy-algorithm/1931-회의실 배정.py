import sys

n = int(sys.stdin.readline())
i = []
for k in range(n):
    i.append(list(map(int, sys.stdin.readline().split())))

i.sort(key=lambda x:(x[1], x[0]))
min = 1
end_time = i[0][1]
for k in range(n-1):
    if end_time <= i[k+1][0]:
        end_time = i[k+1][1]
        min += 1
print(min)