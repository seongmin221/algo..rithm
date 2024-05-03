//
//  징검다리.swift
//  Swift_programmers
//
//  Created by 이성민 on 5/3/24.
//

import Foundation

//struct Node: Equatable, Comparable {
//    static func < (lhs: Node, rhs: Node) -> Bool {
//        lhs.offset < rhs.offset
//    }
//
//    let st: Int
//    let en: Int
//    var offset: Int { en - st }
//}
//
//class MinHeap {
//    var nodes: [Node] = [.init(st: -1, en: -1)]
//    var count: Int { nodes.count }
//}
//
//extension MinHeap {
//    func insert(_ node: Node) {
//        if nodes.count == 1 {
//            nodes.append(node)
//            return
//        }
//
//        nodes.append(node)
//        var child = count - 1
//        var parent = child / 2
//        while nodes[child].offset < nodes[parent].offset {
//            nodes.swapAt(child, parent)
//            child = parent
//            parent = child / 2
//        }
//    }
//
//    func pop() -> Node? {
//        if count == 1 { return nil }
//
//        nodes.swapAt(1, count-1)
//        let root = nodes.removeLast()
//
//        var p = 1
//        var lc: Int { p * 2 }
//        var rc: Int { p * 2 + 1 }
//        while true {
//            if lc >= count && rc >= count { break } // 자식이 없을 때
//            else if lc < count && rc >= count { // 왼쪽 자식만 있을 때
//                if nodes[lc] < nodes[p] {
//                    nodes.swapAt(lc, p)
//                }
//                break
//            }
//            else if lc < count && rc < count { // 양쪽 자식 다 있을 때
//                if nodes[lc] < nodes[p] && nodes[rc] < nodes[p] {
//                    if nodes[rc] < nodes[lc] {
//                        nodes.swapAt(rc, p)
//                        p = rc
//                    }
//                    else {
//                        nodes.swapAt(lc, p)
//                        p = lc
//                    }
//                }
//                else if nodes[lc] < nodes[p] && nodes[p] < nodes[rc] {
//                    nodes.swapAt(lc, p)
//                    p = lc
//                }
//                else if nodes[p] < nodes[lc] && nodes[rc] < nodes[p] {
//                    nodes.swapAt(rc, p)
//                    p = rc
//                }
//            }
//        }
//
//        return root
//    }
//}
//
//func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
//
//    if n == rocks.count { return distance }
//
//    let rocks = [0] + rocks.sorted() + [distance]
//    var road: [Int] = .init(repeating: 0, count: distance + 1)
//    for rock in rocks { road[rock] = 1 }
//
//    var minHeap: MinHeap = .init()
//    for i in 0..<rocks.count-1 {
//        minHeap.insert(.init(st: rocks[i], en: rocks[i+1]))
//    }
//
//    var mergedStart: Set<Int> = []
//    var mergedEnd: Set<Int> = []
//
//    var currentNode: Node? = nil
//    var removed: Int = 0
//    while removed < n {
//        guard let node = minHeap.pop() else { break }
//        if mergedStart.contains(node.st) || mergedEnd.contains(node.en) { continue }
//
//
//    }
//
//    return 0
//}


//func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
//    
//    var result: Int = 0
//    let rocks = rocks.sorted() + [distance]
//    
//    var minDist = 1
//    var maxDist = distance
//    
//    while minDist <= maxDist {
//        let dist = (minDist + maxDist) / 2
//        print(minDist, maxDist)
//        var removed: Int = 0
//        var prev: Int = 0
//        for rock in rocks {
//            if rock - prev < dist {
//                removed += 1
//                continue
//            }
//            prev = rock
//        }
//        print("--")
////        if dist - prev < dist { removed += 1 }
//        
//        if removed == n { result = dist }
//        if removed <= n {
//            minDist = dist + 1
//        } else {
//            maxDist = dist - 1
//        }
//    }
//    
//    return result
//}
//
//print(solution(25, [2, 14, 11, 21, 17], 2))


func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
    
    var result: Int = 0
    let rocks = rocks.sorted() + [distance]
    
    var minDist = 1
    var maxDist = distance
    
    while minDist <= maxDist {
        let dist = (minDist + maxDist) / 2
        var removed: Int = 0
        var prev: Int = 0
        for rock in rocks {
            if rock - prev < dist {
                removed += 1
                continue
            }
            prev = rock
        }
        
        if removed <= n {
            result = dist
            minDist = dist + 1
        } else {
            maxDist = dist - 1
        }
    }
    
    return result
}
