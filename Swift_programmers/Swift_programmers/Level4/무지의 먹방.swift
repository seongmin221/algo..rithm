//
//  무지의 먹방.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

struct MinHeap<Node: Comparable> {
    var nodes: [Node]
    
    var root: Node? { isEmpty ? nil : nodes[1] }
    var isEmpty: Bool { nodes.count <= 1 }
    var count: Int {
        if nodes.isEmpty { return 0 }
        else { return nodes.count - 1 }
    }
}

extension MinHeap {
    mutating func insertNode(_ node: Node) {
        if nodes.isEmpty { nodes.append(node) }
        nodes.append(node)
        sortDown()
    }
    
    mutating func popNode() -> Node? {
        guard nodes.count > 1 else { return nil }
        
        let popped = nodes[1]
        nodes.swapAt(1, nodes.count-1)
        sortUp()
        
        return popped
    }
    
    mutating func sortUp() {
        var c = nodes.count - 1
        var p = c / 2
        
        while p >= 1 {
            if nodes[p] > nodes[c] {
                nodes.swapAt(p, c)
                c = p
                p = c / 2
            }
            else { break }
        }
    }
    
    mutating func sortDown() {
        var p = 1
        
        while true {
            let lc = p * 2
            let rc = p * 2 + 1
            
            if lc >= nodes.count { break }
            
            if lc == nodes.count - 1 {
                if nodes[p] > nodes[lc] {
                    nodes.swapAt(p, lc)
                }
                break
            }
            
            if rc < nodes.count {
                if nodes[lc] <= nodes[rc] {
                    guard nodes[lc] < nodes[p] else { break }
                    nodes.swapAt(lc, p)
                    p = lc
                }
                else {
                    guard nodes[rc] < nodes[p] else { break }
                    nodes.swapAt(rc, p)
                    p = rc
                }
            }
        }
    }
}

struct Food: Comparable {
    var id: Int
    var time: Int
    
    static func <(lhs: Food, rhs: Food) -> Bool {
        return lhs.time < rhs.time
    }
}

func solution(_ food_times: [Int], _ k: Int64) -> Int {
    
    let foodTimes = food_times
    let foodCount = food_times.count
    var k = Int(k)
    
    if k >= foodTimes.reduce(0, +) {
        return -1
    }
    
    var foods: [(id: Int, time: Int)] = []
    for (id, foodTime) in foodTimes.enumerated() {
        foods.append((id+1, foodTime))
    }
    
    var sortedFoods = foods.sorted(by: { $0.time > $1.time })
    var lastRemoved = 0
    while true {
        guard let minTime = sortedFoods.last?.time else { break }
        let removedTime = (minTime - lastRemoved) * sortedFoods.count
        
        if k - removedTime >= 0 {
            k -= removedTime
            lastRemoved = minTime
            sortedFoods.removeLast()
        }
        else { break }
    }
    
    sortedFoods.sort(by: { $0.id < $1.id })
    
    return sortedFoods[k].id
}

//print(solution([3,1,2], 5))
//print(solution([4, 2, 3, 6, 7, 1, 5, 8], 16))

//while left < right {
//    var stones = stones
//    let crossed = (left + right) / 2
//    var emptyStoneCount: Int = 0
//    for i in 0..<stones.count {
//        if stones[i] - crossed <= 0 {
//            emptyStoneCount += 1
//            if emptyStoneCount >= k {
//                break
//            }
//        }
//        else {
//            emptyStoneCount = 0
//        }
//    }
//
//    if emptyStoneCount >= k {
//        right = crossed
//    } else {
//        left = crossed + 1
//    }
//}
