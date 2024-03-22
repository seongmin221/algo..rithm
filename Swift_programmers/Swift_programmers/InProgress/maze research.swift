//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/19/24.
//

import Foundation

//struct Road: Hashable {
//    let source: Int
//    let dest: Int
//    let weight: Int
//}
//
//func solution(
//    _ n: Int,
//    _ start: Int,
//    _ end: Int,
//    _ roads: [[Int]],
//    _ traps: [Int]
//) -> Int {
//    
//    var result: Int = Int.max
//    
//    typealias Map = [Int: [Road]]
//    
//    var traps: Set<Int> = Set(traps)
//    var trapOffMap: Map = [:]
//    var trapOnMap: Map = [:]
//    for i in 1...n {
//        trapOffMap[i] = []
//        trapOnMap[i] = []
//    }
//    
//    for road in roads {
//        let a = road[0]
//        let b = road[1]
//        let w = road[2]
//        trapOffMap[a]!.append(.init(source: a, dest: b, weight: w))
//        trapOnMap[b]!.append(.init(source: b, dest: a, weight: w))
//    }
//    
//    
//    func dfs(pos: Int, isTrapOn: Bool, weight: Int, roadVisited: Set<Road>) {
//        if pos == end {
//            result = min(result, weight)
//            return
//        }
//        
//        var isTrapOn: Bool = isTrapOn
//        if traps.contains(pos) { isTrapOn.toggle() }
//        
//        let map: Map = isTrapOn ? trapOnMap : trapOffMap
//        var visited: Set<Road> = roadVisited
//        
//        for road in map[pos]! {
//            guard !visited.contains(road) else { continue }
//            
//            visited.insert(road)
//            let newWeight = weight + road.weight
//            
//            dfs(
//                pos: road.dest,
//                isTrapOn: isTrapOn,
//                weight: newWeight,
//                roadVisited: visited
//            )
//        }
//    }
//    
//    dfs(pos: 1, isTrapOn: false, weight: 0, roadVisited: [])
//    
//    return result
//}

//struct Road {
//    var src: Int
//    var dest: Int
//    var weight: Int
//}
//
//struct MazeState {
//    var cost: Int
//    var roads: [Road]
//    var usedRoads:
//}


//struct Node: Equatable {
//    let id: Int
//    var incoming: [Int]
//    var outgoing: [Int]
//    
//    var connected: [Int] { incoming + outgoing }
//    
//    init(id: Int, incoming: [Int] = [], outgoing: [Int] = []) {
//        self.id = id
//        self.incoming = incoming
//        self.outgoing = outgoing
//    }
//    
//    static func == (lhs: Node, rhs: Node) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
//
//extension Node {
//    mutating func trapTriggered() {
//        swap(&incoming, &outgoing)
//    }
//    
//    mutating func trapTriggered(from node: Int) {
//        if let n = incoming.firstIndex(of: node), let m = outgoing.firstIndex(of: node) {
//            incoming.remove(at: n)
//            outgoing.append(node)
//            outgoing.remove(at: m)
//            incoming.append(node)
//        }
//    }
//}
//
//struct Road {
//    let src1: Int
//    let src2: Int
//    let weight: Int
//}
//
//func solution(
//    _ n: Int,
//    _ start: Int,
//    _ end: Int,
//    _ roads: [[Int]],
//    _ traps: [Int]
//) -> Int {
//    
//    let trapSet: Set<Int> = Set(traps)
//    var dp: [Int] = .init(repeating: .max, count: n+1)
//    
//    var nodes: [Node] = [.init(id: 0)]
//    var roadDict: [Int: [Road]] = [:]
//    
//    for i in 1...n {
//        nodes.append(.init(id: i))
//        roadDict[i] = []
//    }
//    
//    for road in roads {
//        let src1 = road[0]
//        let src2 = road[1]
//        nodes[src1].outgoing.append(src2)
//        nodes[src2].incoming.append(src1)
//        
//        let weight = road[2]
//        roadDict[src1]!.append(.init(src1: src1, src2: src2, weight: weight))
//        roadDict[src2]!.append(.init(src1: src2, src2: src1, weight: weight))
//    }
//    
//    
//    func iterate(src: Int, weight: Int, nodes: [Node]) {
//        var roads: [Road] = []
//        let destinations = nodes[src].outgoing
//        for dest in destinations {
//            roads += roadDict[src]!.filter { $0.src2 == dest }
//        }
//        
//        for road in roads {
//            let newWeight = weight + road.weight
//            let dest = road.src2
//            guard dp[dest] > newWeight else { continue }
//            dp[dest] = newWeight
//            print("src: \(src), dest: \(dest), roads: \(roads)")
//            var newNodes = nodes
//            if trapSet.contains(dest) {
//                newNodes[dest].trapTriggered()
//                newNodes[dest].connected.forEach {
//                    newNodes[$0].trapTriggered(from: dest)
//                }
//            }
//            
//            iterate(src: dest, weight: newWeight, nodes: newNodes)
//        }
//    }
//    
//    iterate(src: 1, weight: 0, nodes: nodes)
//    
//    return dp[end]
//}


struct MinHeap<Node: Comparable> {
    var nodes: [Node]
}

extension MinHeap {
    
}


func solution(
    _ n: Int,
    _ start: Int,
    _ end: Int,
    _ roads: [[Int]],
    _ traps: [Int]
) -> Int {
    
    
    
    return 0
}



//print(solution(3, 1, 3, [[1, 2, 2], [3, 2, 3]], [2]))
//print(solution(4, 1, 4, [[1, 2, 1], [3, 2, 1], [2, 4, 1]], [2, 3]))
