//
//  10869-사칙연산.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2023/03/10.
//

import Foundation

var nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
print(nums[0] + nums[1])
print(nums[0] - nums[1])
print(nums[0] * nums[1])
print(nums[0] / nums[1])
print(nums[0] % nums[1])
