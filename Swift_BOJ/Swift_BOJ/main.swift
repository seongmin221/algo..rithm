//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2/1/24.
//

import Foundation

func solution() -> Int {
    
    // MARK: - Input values
    let input = readLine()!
        .split(separator: " ")
        .map { Int(String($0))! }
    let N = input[0]
    let K = input[1]
    var H = input[2]
    
    var patterns: [[Int]] = []
    for _ in 0..<K {
        let pattern = readLine()!
            .split(separator: " ")
            .map { Int(String($0))! }
        patterns.append(pattern)
    }
    
    // MARK: - Logic
    var neededCost: [Int] = .init(repeating: 0, count: N + 1)
    var position: [Int] = .init(0...N)
    
    
    
    return 0
}
