//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/27/24.
//

import Foundation

func solution(_ n: Int, _ roads: [[Int]], _ sources: [Int], _ destination: Int) -> [Int] {
    
    var map: [Int: [Int]] = [:]
    for i in 0..<n { map[i+1] = [] }
    for road in roads {
        map[road[0]]!.append(road[1])
        map[road[1]]!.append(road[0])
    }
    
    var dij: [Int] = Array(repeating: 500000, count: n + 1)
    dij[destination] = 0
    
    var queue: [Int] = [destination]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        var nextVisit: [Int] = []
        
        for n in map[node]! {
            if dij[n] > dij[node] + 1 {
                dij[n] = dij[node] + 1
                nextVisit.append(n)
            }
        }
        queue += nextVisit
    }
    
    var result: [Int] = sources.map { dij[$0] }
    for i in 0..<result.count {
        if result[i] == 500000 { result[i] = -1 }
    }
    
    return result
}


//print(solution(3, [[1, 2], [2, 3]], [2,3], 1))
//print(solution(5, [[1, 2], [1, 4], [2, 4], [2, 5], [4, 5]], [1,3,5], 5))
