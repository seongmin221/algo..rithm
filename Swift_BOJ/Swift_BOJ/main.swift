//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 1/5/24.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
var dp = Array(repeating: 1, count: n)

for k in 1..<n {
    for j in 0..<k {
        if arr[j] > arr[k] {
            dp[k] += 1
        }
    }
}

print(dp)

// 10 9 7 6 5
