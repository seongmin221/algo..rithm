//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/6/24.
//

import Foundation

//func solution(_ n: Int, _ lighthouse: [[Int]]) -> Int {
//    
//    var result = 0
//    
//    var dict: [Int: Set<Int>] = [:]
//    for i in 1..<n+1 { dict[i] = [] }
//    for l in lighthouse {
//        dict[l[0]]!.insert(l[1])
//        dict[l[1]]!.insert(l[0])
//    }
//    
//    var endPoints: [Int] {
//        dict.filter { $0.value.count == 1 }
//            .map { $0.key }
//    }
//    
//    while !endPoints.isEmpty {
//        var turnOn: Set<Int> = []
//        endPoints.flatMap { dict[$0]! }
//            .forEach { turnOn.insert($0) }
//        
//        for to in turnOn {
//            for near in dict[to]! {
//                dict[near]!.remove(to)
//            }
//            result += 1
//        }
//    }
//    
//    for (key, value) in dict {
//        if value.count == 0 { dict[key] = nil }
//    }
//    
//    
//    
//    var mostConnected: [Int] = dict
//        .sorted(by: { $0.value.count > $1.value.count })
//        .map { $0.key }
//    for key in mostConnected {
//        
//    }
//    
//    
//    print(dict)
//    
//    return result
//}

func solution(_ n: Int, _ lighthouse: [[Int]]) -> Int {
    
    var dict: [Int: [Int]] = [:]
    for edge in lighthouse {
        dict[edge[0], default: []].append(edge[1])
        dict[edge[1], default: []].append(edge[0])
    }
    
    var isOn: [Bool] = .init(repeating: false, count: n+1)
    var result = 0
    func dfs(node: Int, parent: Int) {
        let children = dict[node]!
        for child in children {
            guard child != parent else { continue }
            
            dfs(node: child, parent: node)
            
            if isOn[child] == false && isOn[node] == false {
                isOn[node] = true
                result += 1
            }
        }
    }
    
    dfs(node: 1, parent: 1)
    
    return result
}

//print(solution(8, [[1, 2], [1, 3], [1, 4], [1, 5], [5, 6], [5, 7], [5, 8]]))
//print(solution(10, [[4, 1], [5, 1], [5, 6], [7, 6], [1, 2], [1, 3], [6, 8], [2, 9], [9, 10]]))
//print(solution(5, [[1,2],[2,3],[3,4],[4,5],[5,1]]))
