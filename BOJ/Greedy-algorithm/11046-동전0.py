# import timeit


# import sys

# n, k = map(int, sys.stdin.readline().split())
# a = []
# for i in range(n):
#     a.append(int(sys.stdin.readline()))
# start_time = timeit.default_timer()
# min = 0
# while k > 0:
#     while k < a[n-1]:
#         n -= 1
#     k -= a[n-1]
#     min += 1
# print(min)



import sys
n, k = map(int, sys.stdin.readline().split())
a = []
for i in range(n):
    a.append(int(sys.stdin.readline()))
min = 0

for i in range(n):
    if int(k/a[n-1-i]) == 0:
        continue
    min += int(k/a[n-1-i])
    k = k % a[n-1-i]
print(min)
