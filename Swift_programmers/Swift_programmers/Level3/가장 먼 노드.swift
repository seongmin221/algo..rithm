//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/1/23.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var map: [Int: [Int]] = [:]
    for i in 1..<n+1 { map[i] = [] }
    for e in edge {
        map[e[0]]!.append(e[1])
        map[e[1]]!.append(e[0])
    }
    
    var minPath: [Int: Int] = [:]
    for i in 1..<n+1 { minPath[i] = Int.max }
    minPath[1] = 0
    
    var queue: [(num: Int, dis: Int)] = [(1, 0)]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let nextNodes = map[node.num]!
        let nextNodesDis = node.dis + 1
        
        for next in nextNodes {
            if minPath[next]! > nextNodesDis {
                minPath[next] = nextNodesDis
                queue.append((next, nextNodesDis))
            }
        }
    }
    
    let farthest = minPath.values.max()
    
    return minPath.values.filter { $0 == farthest }.count
}


// MARK: - 1차 시도

//import Foundation
//
//func solution(_ n:Int, _ edge:[[Int]]) -> Int {
//    
//    var map: [Int: [Int]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    for e in edge {
//        map[e[0]]!.append(e[1])
//        map[e[1]]!.append(e[0])
//    }
//    
//    var needVisit = [1]
//    var paths = [[Int]()]
//    var visited = [Int]()
//    
//    var minPath: [Int: Int] = [:]
//    for i in 1..<n+1 { minPath[i] = Int.max }
//    
//    while !needVisit.isEmpty {
//        let node = needVisit.removeLast()
//        var path = paths.removeLast()
//        
//        if path.contains(node) { continue }
//        
//        path.append(node)
//        let nextNodes = map[node]!.filter { !path.contains($0) }
//        
//        if nextNodes.isEmpty {
//            minPath[node] = min(minPath[node]!, path.count)
//            continue
//        }
//        
//        needVisit += nextNodes
//        paths += Array(repeating: path, count: nextNodes.count)
//    }
//    
//    let maxCount = minPath.values.max()
//    
//    return minPath.values.filter { $0 == maxCount }.count
//}


print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
