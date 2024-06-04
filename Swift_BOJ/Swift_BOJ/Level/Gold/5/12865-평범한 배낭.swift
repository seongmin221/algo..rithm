//
//  12865-평범한 배낭.swift
//  Swift_BOJ
//
//  Created by 이성민 on 6/4/24.
//

import Foundation

func solution() -> Int {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let N = input[0]
    let K = input[1]
    
    var things: [(w: Int, v: Int)] = [(0, 0)]
    for _ in 0..<N {
        let thing = readLine()!.split(separator: " ").map { Int($0)! }
        things.append((thing[0], thing[1]))
    }
    
    var memo: [[Int]] = .init(repeating: .init(repeating: 0, count: K+1), count: N+1)
    for i in 1...N {
        let w = things[i].w
        let v = things[i].v
        for j in 1...K {
            if j < w {
                memo[i][j] = memo[i-1][j]
            } else {
                memo[i][j] = max(memo[i-1][j], memo[i-1][j-w] + v)
            }
        }
    }
    return memo[N][K]
}

//print(solution())
