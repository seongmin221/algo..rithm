from re import L
import sys, math
input = sys.stdin.readline

N = int(input().rstrip())
cards = list(map(int, input().split()))
M = int(input().rstrip())
nums = list(map(int, input().split()))
r = [0 for _ in range(len(nums))]
sort = nums[:]
sort.sort()
for card in cards:
    tmp = sort
    while tmp:
        mid = math.floor(len(tmp)/2)
        if card == tmp[mid]:
            r[nums.index(card)] += 1
            break
        elif card > tmp[mid]:
            tmp = tmp[mid+1:]
        elif card < tmp[mid]:
            tmp = tmp[:mid]

print(*r)
