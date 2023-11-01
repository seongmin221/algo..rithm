//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/1/23.
//

import Foundation

// 송전탑의 개수 n
// 그리고 전선 정보 wires

// 전선들 중 하나를 끊어서 송전탑 개수가 가능한 비슷하도록 두 전력망으로 나누었을 때
// 두 전력망이 가지고 있는 송전탑 개수의 차이(절대값)를 return

// 1. 주어진 wires 를 돌아가면서 끊기
// 2. 끊은 후 나눠지는 연결되는 하나의 그룹 찾기 -> nodeCount (by. dfs)
// 3. groupCount - n/2 가 최소가 되는 값 찾기
// 4. return abs(2 * groupCount - n)

func solution(_ n: Int, _ wires: [[Int]]) -> Int {
    
    func createTree(with wires: [[Int]]) -> [Int: [Int]] {
        var tree = Dictionary<Int, [Int]>()
        for wire in wires {
            if tree.keys.contains(wire[0]) {
                tree[wire[0]]?.append(wire[1])
            } else {
                tree[wire[0]] = [wire[1]]
            }
            
            if tree.keys.contains(wire[1]) {
                tree[wire[1]]?.append(wire[0])
            } else {
                tree[wire[1]] = [wire[0]]
            }
        }
        return tree
    }
    
    func findNodeCount(remove removedIndex: Int) -> Int {
        var wires = wires
        _ = wires.remove(at: removedIndex)
        let tree = createTree(with: wires)
        
        var visited = [Int]()
        var needVisit = [1]
        
        while !needVisit.isEmpty {
            let node = needVisit.removeLast()
            if visited.contains(node) { continue }
            
            visited.append(node)
            needVisit += tree[node] ?? []
        }
        
        return visited.count
    }
    
    var nodeCount = 0
    var minDiff = Int.max
    
    for i in 0..<wires.count {
        nodeCount = findNodeCount(remove: i)
        minDiff = (min(minDiff, abs(2 * nodeCount - n)))
    }
    
    return minDiff
}
