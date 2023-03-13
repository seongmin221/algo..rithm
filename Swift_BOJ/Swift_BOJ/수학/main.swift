//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2023/03/03.
//

import Foundation

var cnt = Int(readLine()!)!
var nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
print("\(nums.min()!) \(nums.max()!)")
