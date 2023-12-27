//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/25/23.
//

import Foundation

func solution(_ n: Int, _ results: [[Int]]) -> Int {
    
    var allRecords: [Int: [Int]] = [:]
    var map: [Int: [Int]] = [:]
    for i in 1..<n+1 {
        allRecords[i] = [0, 0]
        map[i] = []
    }
    for result in results { map[result[0]]!.append(result[1]) }
    
    for i in 1..<n+1 {
        var needVisit: [Int] = [i]
        var visited: [Int] = []
        
        while !needVisit.isEmpty {
            let node = needVisit.removeLast()
            
            if visited.contains(node) { continue }
            
            allRecords[i]![0] += 1
            allRecords[node]![1] += 1
            needVisit += map[node]!
            visited.append(node)
        }
    }
    
    var result = 0
    allRecords.values.forEach { record in
        if record.reduce(0, { $0 + $1 }) == n + 1 {
            result += 1
        }
    }
    
    return result
}

print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]))
