//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/25/23.
//

import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    
    var result = [0, 0, 0, 0]
    
    // 갈 수 있는 길들 mapping
    var map: [Int: [Int]] = [:]
    for edge in edges {
        if map[edge[0]] != nil { map[edge[0]]!.append(edge[1]) }
        else { map[edge[0]] = [edge[1]] }
    }
    
//    // 비어있는 칸 있으면 빈 배열로 추가
//    let pointCount = map.keys.max()!
//    for index in 1..<pointCount+1 { if map[index] == nil { map[index] = [] } }
    
    // 정점 찾기
    var origin = 0
    var possibleOrigin = map.filter{ $0.value.count >= 2 }.keys
    possibleOrigin.forEach { po in
        if map.values.allSatisfy({ !$0.contains(po) }) { origin = po }
    }
    
    
    var startPoints = map[origin]!
    var visited = [origin]
    while !startPoints.isEmpty {
        var point = startPoints.removeFirst()
        
        guard let nextPoints = map[point] else {
            result[2] += 1
            continue
        }
        
        if nextPoints.count == 2 { result[3] += 1; continue }
        
        if visited.contains(point) {
            result[1] += 1
            continue
        }
        
        visited.append(point)
        startPoints += map[point]!
    }
    
    result[0] = origin
    
    return result
}





//func solution(_ edges:[[Int]]) -> [Int] {
//    
//    var result = [0, 0, 0, 0]
//    
//    // 갈 수 있는 길들 mapping
//    var map: [Int: [Int]] = [:]
//    for edge in edges {
//        if map[edge[0]] != nil {
//            map[edge[0]]!.append(edge[1])
//        }
//        else {
//            map[edge[0]] = [edge[1]]
//        }
//    }
//    
//    // 비어있는 칸 있으면 빈 배열로 추가
//    let pointCount = map.keys.max()!
//    for index in 1..<pointCount+1 { if map[index] == nil { map[index] = [] } }
//    
//    // 정점 찾기
//    var origin = 0
//    var possibleOrigin = map.filter{ $0.value.count >= 2 }.keys
//    possibleOrigin.forEach { po in
//        if map.values.allSatisfy({ !$0.contains(po) }) { origin = po }
//    }
//    
//    // 길 돌리기
//    var points = Array(1..<pointCount+1)
//    points.remove(at: points.firstIndex(of: origin)!)
//    let lineEnd = points.filter { map[$0]!.count == 0 }
//    
//    let eightLoopOrigin = points.filter { map[$0]!.count == 2 }
//    
//    var donutCount = 0
//    var visited = [Int]()
//    var possibleDonutPoints = points
//        .filter { !lineEnd.contains($0) }
//        .filter { !eightLoopOrigin.contains($0) }
//    
//    for point in possibleDonutPoints {
//        if map[point]! == [point] {
//            donutCount += 1
//            continue
//        }
//        if visited.contains(point) {
//            donutCount += 1
//            visited = []
//            continue
//        }
//        visited.append(point)
//    }
//    
//    result[0] = origin
//    result[1] = donutCount
//    result[2] = lineEnd.count
//    result[3] = eightLoopOrigin.count
//    
//    return result
//}

//print(solution([[2,3], [4,3], [1,1], [2,1]]))
//print(solution([[4,11],[1,12],[8,3],[12,7],[4,2],[7,11],[4,8],[9,6],[10,11],[6,10],[3,5],[11,1],[5,3],[11,9],[3,8]]))
//print(solution([[4,11],[1,12],[8,3],[12,7],[7,11],[4,8],[9,6],[10,11],[6,10],[3,5],[11,1],[5,3],[11,9],[3,8]]))



//import Foundation
//
//func solution(_ edges:[[Int]]) -> [Int] {
//    
//    var result = [0, 0, 0, 0]
//    
//    var map: [Int: [Int]] = [:]
//    for edge in edges {
//        if map[edge[0]] != nil {
//            map[edge[0]]!.append(edge[1])
//        }
//        else {
//            map[edge[0]] = [edge[1]]
//        }
//    }
//    
//    // 비어있는 칸 있으면 빈 배열로 추가
//    let pointCount = map.keys.max()!
//    for index in 1..<pointCount+1 { if map[index] == nil { map[index] = [] } }
//    
//    // 정점 찾기
//    var origin = 0
//    var possibleOrigins = map.filter{ $0.value.count >= 2 }.keys
//    possibleOrigin.forEach { po in
//        if map.values.allSatisfy({ !$0.contains(po) }) { origin = po }
//    }
//    result[0] = origin
//    
//    // 길 돌리기
//    for start in map[origin]! {
//        
//        var needVisit = [start]
//        var visited: [Int] = []
//        while !needVisit.isEmpty {
//            let point = needVisit.removeLast()
//
//            if map[point]!.count == 0 { result [2] += 1; break }
//            if map[point]!.count >= 2 { result[3] += 1; break }
//            if visited.contains(point) { result[1] += 1; break }
//            
//            visited.append(point)
//            needVisit += map[point]!
//        }
//    }
//    
//    return result
//}
