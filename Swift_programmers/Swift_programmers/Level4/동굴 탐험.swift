//
//  동굴 탐험.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/5/24.
//

import Foundation

func solution(_ n: Int, _ path: [[Int]], _ order: [[Int]]) -> Bool {
    
    var caveMap: [Int: [Int]] = [:]
    for i in 0..<n { caveMap[i] = [] }
    for p in path {
        caveMap[p[0]]!.append(p[1])
        caveMap[p[1]]!.append(p[0])
    }
    
    var conditionMap: [Int: Int] = [:]
    var locked: Set<Int> = []
    var keys: Set<Int> = []
    for ord in order {
        conditionMap[ord[0]] = ord[1]
        conditionMap[ord[1]] = ord[0]
        locked.insert(ord[1])
        keys.insert(ord[0])
    }
    
    var needVisit: [Int] = [0]
    var visited: Set<Int> = []
    // 잠겨있는 곳을 가서 키가 필요했던 곳
    // 잠금만 해제하면 바로 방문 가능
    var needVisitKeys: Set<Int> = []
    
    while !needVisit.isEmpty {
        let pos = needVisit.removeLast()
        print("pos", pos)
        if visited.contains(pos) { print("-previously visisted"); continue }
        
        if locked.contains(pos) {
            needVisitKeys.insert(conditionMap[pos]!)
            print("-locked: need key \(conditionMap[pos]!)")
            continue
        }
        
        if keys.contains(pos) {
            locked.remove(conditionMap[pos]!)
            print("-unlocked: lock \(conditionMap[pos]!) / key \(pos)")
        }
        
        if needVisitKeys.contains(pos) {
            needVisitKeys.remove(pos)
            needVisit.append(conditionMap[pos]!)
            print("-unlocked: previously locked \(conditionMap[pos]!) / key \(pos)")
            print("-nextVisit: now unlocked \(conditionMap[pos]!)")
        }
        
        needVisit += caveMap[pos]!
        visited.insert(pos)
        print(" ")
    }
    
    return visited.count == n
}

//print(solution(9, [[0,1],[0,3],[0,7],[8,1],[3,6],[1,2],[4,7],[7,5]], [[8,5],[6,7],[4,1]]))
//print(solution(9, [[8,1],[0,1],[1,2],[0,7],[4,7],[0,3],[7,5],[3,6]], [[4,1],[5,2]]))
//print(solution(9, [[0,1],[0,3],[0,7],[8,1],[3,6],[1,2],[4,7],[7,5]], [[4,1],[8,7],[6,5]]))
