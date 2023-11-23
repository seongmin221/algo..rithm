//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/16/23.
//

import Foundation

// 각 노드에 있는 양 또는 늑대에 대한 정보가 담긴 배열 info
// 2진 트리의 각 노드들의 연결 관계를 담은 2차원 배열 edges


func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
    
     
    
    return 0
}



//func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
//
//    var nodeInfo = info
//    var map: [Int: [Int]] = [:]
//    for i in 0..<nodeInfo.count { map[i] = [] }
//    for edge in edges { map[edge[0]]!.append(edge[1]) }
//
//    var sheepNodes = nodeInfo.enumerated()
//        .filter { index, info in info == 0 }
//        .map { $0.offset }
//    var sheepPaths: [[Int]] = []
//
//    while !sheepNodes.isEmpty {
//        let sheep = sheepNodes.removeFirst()
//        var path = [Int]()
//        path.append(sheep)
//
//        var node = sheep
//        while true {
//            if node == 0 { break }
//
//            var parentNode = map.first(where: { $0.value.contains(node) })!.key
//            path.append(parentNode)
//            node = parentNode
//        }
//
//        sheepPaths.append(path)
//    }
//    //    sheepPaths.sort(by: { f, s in
//    //        if f.count < s.count { return true }
//    //        else { return false }
//    //    })
//
//    var followingSheeps = 0
//    var followingWolves = 0
//    while !sheepPaths.isEmpty {
//        var path = sheepPaths.removeFirst()
//        print("path: \(path)")
//        var sheepCount = 0
//        var wolfCount = 0
//        var pathInfo = path
//        while !pathInfo.isEmpty {
//            var node = pathInfo.removeLast()
//            //            print("node: \(node)")
//            switch nodeInfo[node] {
//            case 0: sheepCount += 1
//            case 1: wolfCount += 1
//            default: continue
//            }
//            //            print("sheepCount: \(sheepCount)", "wolfCount: \(wolfCount)")
//            guard followingSheeps + sheepCount > followingWolves + wolfCount else { break }
//        }
//        guard followingSheeps + sheepCount > followingWolves + wolfCount else { break }
//        followingSheeps += sheepCount
//        followingWolves += wolfCount
//        path.forEach { nodeInfo[$0] = -1 }
//
//        //        print("followingSheeps: \(followingSheeps)", "followingWolves: \(followingWolves)")
//        //
//        print("not sorted sheepPaths: \(sheepPaths)")
//        sheepPaths.sort(by: { f, s in
//            var fWolf = 0
//            var sWolf = 0
//            f.forEach { fWolf += nodeInfo[$0] == 1 ? 1 : 0 }
//            s.forEach { sWolf += nodeInfo[$0] == 1 ? 1 : 0 }
//            if fWolf < sWolf { return true }
//            else if fWolf == sWolf {
//                if f.count < s.count { return true }
//                else { return false }
//            }
//            else { return false }
//        })
//        print("sorted sheepPaths: \(sheepPaths)")
//        print("")
//    }
//
//    return followingSheeps
//}



//func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
//
//    var map: [Int: [Int]] = [:]
//    for i in 0..<info.count { map[i] = [] }
//    for edge in edges { map[edge[0]]!.append(edge[1]) }
//
//    var sheepNodes = info.enumerated()
//        .filter { index, info in info == 0 }
//        .map { $0.offset }
//    var sheepPaths: [[Int]?] = []
//
//    while !sheepNodes.isEmpty {
//        let sheep = sheepNodes.removeFirst()
//        var path = [Int]()
//        path.append(sheep)
//
//        var node = sheep
//        while true {
//            if node == 0 { break }
//
//            var parentNode = map.first(where: { $0.value.contains(node) })!.key
//            path.append(parentNode)
//            node = parentNode
//        }
//
//        sheepPaths.append(path)
//    }
//    sheepPaths.sort(by: { f, s in
//        if f!.count < s!.count { return true }
//        else if f!.count == s!.count {
//            var fDiff = 0
//            var sDiff = 0
//            f!.forEach { fDiff += info[$0] == 0 ? 1 : -1 }
//            s!.forEach { sDiff += info[$0] == 0 ? 1 : -1 }
//            if fDiff >= sDiff { return true }
//            else { return false }
//        }
//        else { return false }
//    })
//
//    var info = info
//    var pathIndex = 0
//    var followingSheeps = 0
//    var followingWolves = 0
//
//    var loopCount = 0
//    while true {
//        guard loopCount <= sheepPaths.compactMap({ $0 }).count else { break }
//        guard var path = sheepPaths[pathIndex] else {
//            pathIndex = (pathIndex + 1) % sheepPaths.count
//            continue
//        }
//        var sheepCount = 0
//        var wolfCount = 0
//        while !path.isEmpty {
//            var node = path.removeLast()
//
//            switch info[node] {
//            case 0: sheepCount += 1
//            case 1: wolfCount += 1
//            default: continue
//            }
//
//            if followingSheeps + sheepCount <= followingWolves + wolfCount { break }
//        }
//
//        if path.isEmpty {
//            followingSheeps += sheepCount
//            followingWolves += wolfCount
//            sheepPaths[pathIndex]!.forEach { info[$0] = -1 }
//            sheepPaths[pathIndex] = nil
//            loopCount = 0
//        }
//        loopCount += 1
//        pathIndex = (pathIndex + 1) % sheepPaths.count
//    }
//
//    return followingSheeps
//}



//var copyInfo: [Int] = []
//var map: [Int: [Int]] = [:]
//var maxSheep = 0
//
//func mapInfo(with edges: [[Int]], count: Int) -> [Int: [Int]] {
//    var map: [Int: [Int]] = [:]
//    for i in 0..<count { map[i] = [] }
//    for edge in edges { map[edge[0]]!.append(edge[1]) }
//    return map
//}
//
//func dfs(_ possibleNodes: [Int], sheep: Int, wolf: Int) {
//    for node in possibleNodes {
//        let nextSheep = sheep + (copyInfo[node] == 0 ? 1 : 0)
//        let nextWolf = wolf + (copyInfo[wolf] == 1 ? 1 : 0)
//
//        guard nextSheep > nextWolf else { continue }
//
//        maxSheep = max(maxSheep, nextSheep)
//
//        var nextPossibleNodes = possibleNodes
//        nextPossibleNodes.remove(at: possibleNodes.firstIndex(of: node)!)
//        nextPossibleNodes.append(contentsOf: map[node]!)
//        dfs(nextPossibleNodes, sheep: nextSheep, wolf: nextWolf)
//    }
//}
//
//func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
//
//    copyInfo = info
//    map = mapInfo(with: edges, count: info.count)
//    dfs([0], sheep: 0, wolf: 0)
//
//    return maxSheep
//}




//func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
//
//    var map: [Int: [Int]] = [:]
//    for i in 0..<info.count { map[i] = [] }
//    for edge in edges { map[edge[0]]!.append(edge[1]) }
//
//    var needVisit = [0]
//    var visited = [Int]()
//    var sheepCount = 0
//    var wolfCount = 0
//
//    while !needVisit.isEmpty {
//        let next = needVisit.removeLast()
//        let nextSheepCount = sheepCount + (info[next] == 0 ? 1 : 0)
//        let nextWolfCount = wolfCount + (info[next] == 1 ? 1 : 0)
//        print("next: \(next)", "nextSheepCount: \(nextSheepCount)", "nextWolfCount: \(nextWolfCount)")
//        guard nextSheepCount > nextWolfCount else {
//            needVisit.insert(next, at: 0)
//            continue
//        }
//
//        needVisit += map[next]!
//        visited.append(next)
//        sheepCount = nextSheepCount
//        wolfCount = nextWolfCount
//        print("next: \(next)", "sheepCount: \(sheepCount)", "wolfCount: \(wolfCount)")
//    }
//
//    return 0
//}




//func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
//
//    var map: [Int: [Int]] = [:]
//    for i in 0..<info.count { map[i] = [] }
//    for edge in edges { map[edge[0]]!.append(edge[1]) }
//
//    var sheepNodes = info.enumerated()
//        .filter { index, info in info == 0 }
//        .map { $0.offset }
//
//    var info = info
//    var needVisit = [0]
//    var sheepCount = 0
//    var wolfCount = 0
//    while !needVisit.isEmpty {
//        var pos = needVisit.removeLast()
//        if sheepNodes.isEmpty { break }
//        print("pos: \(pos)")
//        switch info[pos] {
//        case 0:
//            sheepCount += 1
//            sheepNodes.remove(at: sheepNodes.firstIndex(of: pos)!)
//            needVisit += map[pos]!
//        case 1:
//            if sheepCount <= wolfCount + 1 { needVisit.insert(pos, at: 0) }
//            else {
//                wolfCount += 1
//                needVisit += map[pos]!
//            }
//        default: continue
//        }
//        print("sheepCount: \(sheepCount)", "wolfCount: \(wolfCount)")
//        info[pos] = -1
//    }
//
//    return 0
//}




//func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
//
//    var map: [Int: [Int]] = [:]
//    for i in 0..<info.count { map[i] = [] }
//    for edge in edges { map[edge[0]]!.append(edge[1]) }
//
//    var sheepNodes = info.enumerated()
//        .filter { index, info in info == 0 }
//        .map { $0.offset }
//    var sheepPaths: [[Int]?] = []
//
//    while !sheepNodes.isEmpty {
//        let sheep = sheepNodes.removeFirst()
//        var path = [Int]()
//        path.append(sheep)
//
//        var node = sheep
//        while true {
//            if node == 0 { break }
//
//            let parentNode = map.first(where: { $0.value.contains(node) })!.key
//            path.append(parentNode)
//            node = parentNode
//        }
//
//        sheepPaths.append(path)
//    }
//
//    var info = info
//    var pathIndex = 0
//    var followingSheeps = 0
//    var followingWolves = 0
//
//    var loopCount = 0
//    while true {
//        guard loopCount <= sheepPaths.compactMap({ $0 }).count else { break }
//        guard var path = sheepPaths[pathIndex] else {
//            pathIndex = (pathIndex + 1) % sheepPaths.count
//            continue
//        }
////        print("path: \(path)")
////        print("followingSheeps: \(followingSheeps)", "followingWolves: \(followingWolves)")
//        var sheepCount = 0
//        var wolfCount = 0
//        while !path.isEmpty {
//            var node = path.removeLast()
//
//            switch info[node] {
//            case 0: sheepCount += 1
//            case 1: wolfCount += 1
//            default: continue
//            }
////            print(followingSheeps + sheepCount, followingWolves + wolfCount)
//            if followingSheeps + sheepCount <= followingWolves + wolfCount { break }
//        }
//
//        if path.isEmpty {
//            followingSheeps += sheepCount
//            followingWolves += wolfCount
//            sheepPaths[pathIndex]!.forEach { info[$0] = -1 }
//            sheepPaths[pathIndex] = nil
//            loopCount = 0
//        }
//        loopCount += 1
//        pathIndex = (pathIndex + 1) % sheepPaths.count
//    }
//
//    return followingSheeps
//}

print(solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]))

print(solution([0,1,0,1,1,0,1,0,0,1,0], [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]]))
