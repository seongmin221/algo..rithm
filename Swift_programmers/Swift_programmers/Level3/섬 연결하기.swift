//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/10/24.
//

import Foundation

func solution(_ n: Int, _ costs: [[Int]]) -> Int {
    var result = 0
    
    var costMap: [Int: [(dest: Int, cost: Int)]] = [:]
    for i in 0..<n { costMap[i] = [] }
    
    for cost in costs {
        costMap[cost[0]]!.append((cost[1], cost[2]))
        costMap[cost[1]]!.append((cost[0], cost[2]))
    }
    
    var needVisit: [(dest: Int, cost: Int)] = [(0, 0)]
    var visited: Set<Int> = Set()
    while visited != Set(0..<n) {
        
        let (s, c) = needVisit.removeFirst()
        if visited.contains(s) { continue }
        
        needVisit += costMap[s]!
        needVisit.sort(by: { $0.cost < $1.cost })
        visited.insert(s)
        result += c
    }
    
    return result
}

//print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))
