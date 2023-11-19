//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/16/23.
//

import Foundation

//func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
//    
//    var info = info
//    
//    var map: [Int: [Int]] = [:]
//    for i in 0..<info.count { map[i] = [] }
//    edges.forEach { map[$0[0]]!.append($0[1]) }
//    
//    // 양한테 가는 경로 일단 다 찾기
//    var sheepNodes = info.enumerated().filter { $0.element == 0 }.map { $0.offset }
//    var pathToSheep: [[Int]] = []
//    while !sheepNodes.isEmpty {
//        var path: [Int] = []
//        
//        var node = sheepNodes.removeFirst()
//        path.append(node)
//        
//        while true {
//            guard node != 0 else { break }
//            let parent = map.first(where: { $0.value.contains(node) })!.key
//            path.append(parent)
//            node = parent
//        }
//        
//        pathToSheep.append(path)
//    }
//    
//    pathToSheep.sort(by: {
//        var s1 = 0
//        var s2 = 0
//        $0.forEach { node in if node == 0 { s1 += 1 }  }
//        $1.forEach { node in if node == 0 { s2 += 1 }  }
//        return s1 > s2
//    })
//    
//    
//    // 양한테 가는 경로 중에 (양 - 늑대) 가 모두 양수가 나오는 순서로 진행
//    var totalSheeps = 0
//    var totalDiff = 0
//    
//    var retryPath: [[Int]] = []
//    var retryCount = 0
//    
//    while !pathToSheep.isEmpty {
//        var path = pathToSheep.removeFirst()
//        var temp = path
////        print("path: \(path)")
//        
//        var sheep = 0
//        var wolf = 0
//        while !temp.isEmpty {
//            var node = temp.removeLast()
//            
//            if info[node] == 0 { totalDiff += 1; sheep += 1 }
//            else if info[node] == 1 { totalDiff -= 1; wolf += 1}
//            else if info[node] == -1 { continue }
////            print("--- node: \(node), sheep: \(sheep), wolf: \(wolf) diff: \(totalDiff)")
//            if totalDiff <= 0 { break }
//        }
//        
//        if totalDiff <= 0 {
//            totalDiff += wolf - sheep
//            pathToSheep.append(path)
//            if !retryPath.contains(path) { retryPath.append(path) }
//        }
//        else {
//            if let i = retryPath.firstIndex(of: path) {
//                retryPath.remove(at: i)
//                retryCount = 0
//            }
//            
//            totalSheeps += sheep
//            path.forEach { info[$0] = -1 }
//        }
//        print("pathToSheep: \(pathToSheep), retry: \(retryPath)")
//        print("")
//        if retryPath == pathToSheep { retryCount += 1 }
//        if retryCount > retryPath.count { break }
//    }
//    
//    return totalSheeps
//}

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    var info = info
    
    var map: [Int: [Int]] = [:]
    for i in 0..<info.count { map[i] = [] }
    edges.forEach { map[$0[0]]!.append($0[1]) }
    
    // 양한테 가는 경로 일단 다 찾기
    var sheepNodes = info.enumerated().filter { $0.element == 0 }.map { $0.offset }
    var pathToSheep: [[Int]] = []
    while !sheepNodes.isEmpty {
        var path: [Int] = []
        
        var node = sheepNodes.removeFirst()
        path.append(node)
        
        while true {
            guard node != 0 else { break }
            let parent = map.first(where: { $0.value.contains(node) })!.key
            path.append(parent)
            node = parent
        }
        
        pathToSheep.append(path)
    }
    
    // 양한테 가는 경로 중에 (양 - 늑대) 가 모두 양수가 나오는 순서로 진행
    var totalSheeps = 0
    var totalWolves = 0
    
    var retryPaths = pathToSheep
    var loopCount = 0
    
    while !pathToSheep.isEmpty {
        var path = pathToSheep.removeFirst()
        var temp = path
        print("path: \(path)")
        var pathSheep = 0
        var pathWolf = 0
        while !temp.isEmpty {
            var node = temp.removeLast()
            
            switch info[node] {
            case 0: pathSheep += 1
            case 1: pathWolf += 1
            default: continue
            }
            
            if totalSheeps + pathSheep > totalWolves + pathWolf { continue }
            else { break }
        }
        
        if totalSheeps + pathSheep > totalWolves + pathWolf {
            totalSheeps += pathSheep
            totalWolves += pathWolf
            path.forEach { info[$0] = -1 }
            retryPaths.removeFirst()
            loopCount = 0
        }
        else {
            pathToSheep.append(path)
        }
        print("pathToSheep: \(pathToSheep), retry: \(retryPaths)")
        print("info: \(info)\n")
        if retryPaths.allSatisfy({ pathToSheep.contains($0) }) { loopCount += 1 }
        if loopCount > retryPaths.count { break }
    }
    
    return totalSheeps
}

print(solution([0,0,1,0,1,1,0,1,1,1,0,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]))
//print(solution([0,1,0,1,1,0,1,0,0,1,0], [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]]))
//print(solution([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [[0, 1], [1, 2], [1, 4], [0, 8], [8, 7], [9, 10], [9, 11], [4, 3], [6, 5], [4, 6], [8, 9]]))

// 2, 7, 9, 10, 12, 14, 16 실패
