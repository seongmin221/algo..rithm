n = int(input())
p = list(map(int, input().split()))
p.sort()
out = 0
for i in range(n+1):
    for j in range(i):
        out += p[j]

print(out)