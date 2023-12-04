//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/3/23.
//

import Foundation

func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    
    var networkCount = 0
    var allComp = Array(0..<n)
    
    while !allComp.isEmpty {
        
        var needVisit = [allComp.first!]
        var visited = [Int]()
        while !needVisit.isEmpty {
            let node = needVisit.removeLast()
            print("allComp: \(allComp)", "needVisit: \(needVisit)")
            if !allComp.contains(node) {
                print("skipped")
                continue
            }
            allComp.remove(at: allComp.firstIndex(of: node)!)
            
            let nextVisit = computers[node].enumerated()
                .filter { $0.element == 1 }
                .map { $0.offset }
            needVisit += nextVisit
        }
        
        networkCount += 1
    }
    
    return networkCount
}

//print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
//print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
