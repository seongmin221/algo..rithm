//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/9/24.
//

import Foundation

//func solution(_ a: [Int], _ edges: [[Int]]) -> Int64 {
//    
//    guard a.reduce(0, { $0 + $1 }) == 0 else { return Int64(-1) }
//    if a.allSatisfy({ $0 == 0 }) { return 0 }
//    
//    var dict: [Int: Set<Int>] = [:]
//    var nodes: [Int: Int] = [:]
//    for i in 0..<a.count {
//        dict[i] = []
//        nodes[i] = a[i]
//    }
//    for edge in edges {
//        dict[edge[0]]!.insert(edge[1])
//        dict[edge[1]]!.insert(edge[0])
//    }
//    
//    
//    func findEndNodes() -> Set<Int> {
//        var endNodes: Set<Int> = []
//        for (key, value) in dict {
//            if value.count == 1 { endNodes.insert(key) }
//            else { continue }
//        }
//        return endNodes
//    }
//    
//    var result = 0
//    var endNodes = findEndNodes()
//    while !endNodes.isEmpty {
//        for node in endNodes {
//            guard let other = dict[node]!.first else { break }
//            result += abs(nodes[node]!)
//            
//            nodes[other]! += nodes[node]!
//            nodes[node] = nil
//            
//            dict[other]!.remove(node)
//            dict[node] = nil
//        }
//        endNodes = findEndNodes()
//    }
//    
//    
//    return Int64(result)
//}

//func solution(_ a: [Int], _ edges: [[Int]]) -> Int64 {
//    
//    guard a.reduce(0, { $0 + $1 }) == 0 else { return Int64(-1) }
//    if a.allSatisfy({ $0 == 0 }) { return 0 }
//    
//    var dict: [Int: Set<Int>] = [:]
//    var offsets: [Int: Int] = [:]
//    for i in 0..<a.count {
//        dict[i] = []
//        offsets[i] = a[i]
//    }
//    for edge in edges {
//        dict[edge[0]]!.insert(edge[1])
//        dict[edge[1]]!.insert(edge[0])
//    }
//    
//    
//    var result = 0
//    while true {
//        for (node, connected) in dict {
//            guard connected.count == 1 else { continue }
//            guard let c = connected.first else { break }
//            result += abs(offsets[node]!)
//            
//            guard offsets[c] != nil else { return Int64(result) }
//            offsets[c]! += offsets[node]!
//            offsets[node] = nil
//            
//            dict[c]!.remove(node)
//            dict[node] = nil
//        }
//    }
//    
//    
//    return Int64(result)
//}

//func solution(_ a: [Int], _ edges: [[Int]]) -> Int64 {
//    
//    guard a.reduce(0, { $0 + $1 }) == 0 else { return Int64(-1) }
//    if a.allSatisfy({ $0 == 0 }) { return 0 }
//    
//    var result: Int = 0
//    
//    var connected: [Int: Set<Int>] = [:]
//    var offsets: [Int: Int] = [:]
//    for i in 0..<a.count {
//        connected[i] = []
//        offsets[i] = a[i]
//    }
//    for edge in edges {
//        connected[edge[0]]!.insert(edge[1])
//        connected[edge[1]]!.insert(edge[0])
//    }
//    
//    func dfs(start: Int, visited: Set<Int>) {
//        var visited = visited
//        visited.insert(start)
//        
//        if connected[start]!.isSubset(of: visited) {
//            result += offsets[start]!
//            return
//        }
//        
//        for node in connected[start]! {
//            guard !visited.contains(node) else { continue }
//            dfs(start: node, visited: visited)
//            print(start, node, result)
//        }
//        
//        return
//    }
//    
//    dfs(start: 0, visited: [])
//    
//    return Int64(result + abs(offsets[0]!))
//}


import Foundation

func solution(_ a: [Int], _ edges: [[Int]]) -> Int64 {
    
    guard a.reduce(0, { $0 + $1 }) == 0 else { return -1 }
    if a.allSatisfy({ $0 == 0 }) { return 0 }
    
    var nodeMap: [Int: [Int]] = [:]
    var nodeOffset: [Int: Int] = [:]
    for i in 0..<a.count {
        nodeMap[i] = []
        nodeOffset[i] = a[i]
    }
    for edge in edges {
        nodeMap[edge[0]]!.append(edge[1])
        nodeMap[edge[1]]!.append(edge[0])
    }
    
    var result: Int = 0
    func dfs(start: Int, parent: Int) {
        for node in nodeMap[start]! {
            guard node != parent else { continue }
            dfs(start: node, parent: start)
        }
        
        nodeOffset[parent]! += nodeOffset[start]!
        result += abs(nodeOffset[start]!)
    }
    
    dfs(start: 0, parent: 0)
    
    return Int64(result)
}

//print(solution([-5,0,2,1,2], [[0,1],[3,4],[2,3],[0,3]]))
