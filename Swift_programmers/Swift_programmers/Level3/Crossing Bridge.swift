//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/14/24.
//

import Foundation

// 징검다리는 일렬로 놓여 있고 각 징검다리의 디딤돌에는 모두 숫자가 적혀 있으며
// 디딤돌의 숫자는 한 번 밟을 때마다 1씩 줄어듭니다.

// 디딤돌의 숫자가 0이 되면 더 이상 밟을 수 없으며
// 이때는 그 다음 디딤돌로 한번에 여러 칸을 건너 뛸 수 있습니다.

// 단, 다음으로 밟을 수 있는 디딤돌이 여러 개인 경우 무조건 가장 가까운 디딤돌로만 건너뛸 수 있습니다.

//struct MinHeap<Node: Comparable> {
//    var nodes: [Node] = []
//    
//    var root: Node? {
//        if isEmpty { return nil }
//        else { return nodes[1] }
//    }
//    var count: Int { return nodes.count }
//    var isEmpty: Bool {
//        if count <= 1 { return true }
//        else { return false }
//    }
//    
//    mutating func insert(node: Node) {
//        if nodes.isEmpty { nodes.append(node) }
//        nodes.append(node)
//        sortUp()
//    }
//    
//    mutating func popNode() -> Node? {
//        guard !isEmpty else { return nil }
//        let element = nodes[1]
//        nodes.swapAt(1, count-1)
//        nodes.removeLast()
//        sortDown()
//        
//        return element
//    }
//}
//
//extension MinHeap {
//    mutating private func sortUp() {
//        var child: Int = count - 1
//        var parent: Int = child / 2
//        while parent >= 1 {
//            guard nodes[child] < nodes[parent] else { break }
//            nodes.swapAt(child, parent)
//            child = parent
//            parent = child / 2
//        }
//    }
//    
//    mutating private func sortDown() {
//        var p: Int = 1
//        while true {
//            let lc: Int = 2 * p
//            let rc: Int = 2 * p + 1
//            // no children
//            if lc > count - 1 { break }
//            
//            // only lc
//            if lc == count - 1 {
//                if nodes[p] > nodes[lc] {
//                    nodes.swapAt(p, lc)
//                    p = lc
//                }
//                break
//            }
//            
//            // need swap
//            // lc <= rc
//            if rc <= count - 1 {
//                if nodes[lc] <= nodes[rc] {
//                    guard nodes[lc] < nodes[p] else { break }
//                    nodes.swapAt(lc, p)
//                    p = lc
//                }
//                else {
//                    guard nodes[rc] < nodes[p] else { break }
//                    nodes.swapAt(rc, p)
//                    p = rc
//                }
//            }
//        }
//    }
//}
//
//struct Node: Comparable {
//    let pos: Int
//    var offset: Int
//    
//    static func <(lhs: Node, rhs: Node) -> Bool {
//        return lhs.offset < rhs.offset
//    }
//}
//
//
//func solution(_ stones: [Int], _ k: Int) -> Int {
//    
//    var minHeap: MinHeap<Node> = .init()
//    for (index, stone) in stones.enumerated() {
//        minHeap.insert(node: .init(pos: index, offset: stone))
//    }
//    var crossed: Int = 0
//    
//    var availableStones: [Int] = .init(repeating: 1, count: stones.count)
//    func countEmptyStones(on pos: Int) -> Int {
//        var sp: Int = pos
//        var ep: Int = pos
//        while true {
//            sp -= 1
//            guard sp >= 0, availableStones[sp] == 0
//            else { sp += 1; break }
//        }
//        while true {
//            ep += 1
//            guard ep < stones.count, availableStones[ep] == 0
//            else { ep -= 1; break }
//        }
//        return ep - sp + 1
//    }
//    
//    var longestEmptyStones: Int = 0
//    while true {
//        var removedStones: [Int] = []
//        guard let removed = minHeap.popNode() else { break }
//        availableStones[removed.pos] = 0
//        removedStones.append(removed.pos)
//        
//        while true {
//            guard let root = minHeap.root,
//                  root.offset == removed.offset,
//                  let r = minHeap.popNode()
//            else { break }
//            
//            availableStones[r.pos] = 0
//            removedStones.append(r.pos)
//        }
//        
//        for pos in removedStones {
//            longestEmptyStones = max(longestEmptyStones, countEmptyStones(on: pos))
//        }
//        guard longestEmptyStones <= k else { break }
//        crossed = removed.offset
//    }
//    
//    return crossed
//}


// 이분탐색 ㄷㄷ

func solution(_ stones: [Int], _ k: Int) -> Int {
    
    var left: Int = 1
    var right: Int = 2_000_000_000
    
    while left < right {
        var stones = stones
        let crossed = (left + right) / 2
        var emptyStoneCount: Int = 0
        for i in 0..<stones.count {
            if stones[i] - crossed <= 0 {
                emptyStoneCount += 1
                if emptyStoneCount >= k {
                    break
                }
            }
            else {
                emptyStoneCount = 0
            }
        }
        
        if emptyStoneCount >= k {
            right = crossed
        } else {
            left = crossed + 1
        }
    }
    
    return left
}

//print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))
