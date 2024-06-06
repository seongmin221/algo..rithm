//
//  4811-알약.swift
//  Swift_BOJ
//
//  Created by 이성민 on 6/6/24.
//

import Foundation


func pills(_ n: Int) -> Int {
    
    var memo: [[Int]] = .init(repeating: .init(repeating: 0, count: n+1), count: n+1)
    for i in 1...n {
        memo[0][i] = 1
    }
    
    for w in 1..<n {
        for h in 0...n-w {
            if h == 0 {
                memo[w][h] = memo[w-1][h+1]
            } else {
                memo[w][h] = memo[w-1][h+1] + memo[w][h-1]
            }
        }
    }
    memo[n][0] = memo[n-1][1]
    
    return memo[n][0]
}

func solution() {
    var inputs: [Int] = []
    while true {
        let n = Int(readLine()!)!
        if n == 0 { break }
        inputs.append(n)
    }
    
    for input in inputs {
        print(pills(input))
    }
}

//solution()

