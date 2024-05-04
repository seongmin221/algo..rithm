//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2/1/24.
//

import Foundation

func solution() -> Int {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var pos = input[0]
    let dest = input[1]
    
    if dest <= pos { return pos - dest }
    
    var dp: [Int] = .init(repeating: 100001, count: 1000001)
    dp[pos] = 0
    for i in 1..<pos+1 {
        dp[pos - i] = dp[pos] + i
    }
    for i in pos+1...dest {
        if i % 2 == 0 { dp[i] = min(dp[i-1] + 1, dp[i/2] + 1) }
        if i % 2 == 1 { dp[i] = min(dp[i-1] + 1, dp[(i+1)/2] + 2)}
    }
    return dp[dest]
}

//print(solution())
