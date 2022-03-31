from re import L
import sys, math
from collections import deque
input = sys.stdin.readline

N = int(input().rstrip())
cards = list(map(int, input().split()))
M = int(input().rstrip())
nums = list(map(int, input().split()))
r = [0 for _ in range(len(nums))]

class node:
    def __init__(self, data):
        self.left = None
        self.right = None
        self.data = data

# def treesort(root, key):
#     if root == None:

#     if root < key:
#         treesort(root.right, key)