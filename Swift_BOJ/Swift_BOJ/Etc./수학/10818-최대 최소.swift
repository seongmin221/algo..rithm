//
//  10818-최대 최소.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2023/03/13.
//

import Foundation

var cnt = Int(readLine()!)!
var nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
print("\(nums.min()!) \(nums.max()!)")
