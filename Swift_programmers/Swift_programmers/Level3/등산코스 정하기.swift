//
//  등산코스정하기.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/23/23.
//

import Foundation

// MARK: -
// MARK: Dijkstra

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//
//    var map: [Int: [(point: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//
//    for gate in gates {
//        var table = Array(repeating: 0, count: n+1)
//        var queue = [gate]
//
//        while !queue.isEmpty {
//            var point = queue.removeFirst()
//            var possibleNext = map[point]!
//
//            if point
//        }
//    }
//
//    return []
//}

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//
//    var result = (summit: 0, weight: Int.max)
//
//    // possible paths and weight
//    var map: [Int: [(point: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//
//    for gate in gates {
//        // dijkstra table
//        var pathMaxWeightTable: [Int: Int] = [:]
//        for i in 1..<n+1 { pathMaxWeightTable[i] = 0 }
//
//        var queue: [(point: Int, weight: Int)] = [(gate, 0)]
//        var visited: [(Int, Int)] = []
//
//        let otherGates = gates.filter { $0 != gate }
//
//        while !queue.isEmpty {
////            print("queue: \(queue)")
//            let current = queue.removeFirst()
////            print("current: \(current)")
//            if visited.contains(where: { $0.0 == current.point }) { continue }
//            if summits.contains(current.point) || otherGates.contains(current.point) { continue }
//
//            visited.append((current.point, current.weight))
//            map[current.point]!
//                .filter{ !gates.contains($0.point) }
//                .forEach { next in
//                    pathMaxWeightTable[next.point]! = max(next.weight, pathMaxWeightTable[current.point]!)
//                    queue.append(next)
//                }
//            queue.sort(by: { $0.weight < $1.weight })
////            print("updatedQueue: \(queue)")
////            print("pathMaxWeightTabel: \(pathMaxWeightTable)")
////            print("--")
//        }
//
//        var minWeightPath = pathMaxWeightTable
//            .filter { summits.contains($0.key) }
//            .sorted(by: {
//                if $0.value < $1.value { return true }
//                else if $0.value == $1.value {
//                    return $0.key < $1.key
//                }
//                else { return false }
//            })
//            .first!
//
//        if result.weight > minWeightPath.value { result = (minWeightPath.key, minWeightPath.value) }
//        else if result.weight == minWeightPath.value {
//            result.summit = min(result.summit, minWeightPath.key)
//        }
//        else { continue }
//    }
//
////    print(pathMaxWeightTable)
//
//    return [result.summit, result.weight]
//}

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//
//    // dijkstra table
//    var minWeight: [Int: Int] = [:]
//    for i in 1..<n+1 { minWeight[i] = Int.max }
//
//    // possible paths and weight
//    var map: [Int: [(point: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//
//    for gate in gates {
//        minWeight[gate] = 0
//        var queue: [(point: Int, weight: Int)] = [(gate, 0)]
//        var visited: [(Int, Int)] = []
//
//        while !queue.isEmpty {
//            print("queue: \(queue)")
//            var current = queue.removeFirst()
//            print("current: \(current)")
//            if gates.filter({ $0 != gate }).contains(current.point) { continue }
//            if summits.contains(current.point) { continue }
//            if visited.contains(where: { $0.0 == current.point }) { continue }
//
//            visited.append((current.point, current.weight))
//            let nextPossiblePoints = map[current.point]!
//            nextPossiblePoints.forEach { next in
//                if minWeight[next.point]! > next.weight {
//                    print("\(next) can append to queue")
//                    minWeight[next.point] = next.weight
//                    queue.append((next.point, next.weight))
//                }
//            }
//            queue.sort(by: { $0.weight < $1.weight })
//            print("updatedQueue: \(queue)")
//            print("minWeight: \(minWeight)")
//            print("--")
//        }
//    }
//    print(minWeight)
//    return []
//}


// MARK: - n차
// MARK: 시간초과

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//    
//    var result: (summit: Int, weight: Int) = (Int.max, Int.max)
//    
//    var map: [Int: [(des: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//    
//    var needVisit = gates
//    var weights = Array(repeating: 0, count: gates.count)
//    var visitedPaths = Array(repeating: [Int](), count: gates.count)
//    
//    while !needVisit.isEmpty {
//        let point = needVisit.removeLast()
//        let weight = weights.removeLast()
//        var path = visitedPaths.removeLast()
//        
//        if path.contains(point) { continue }
//        if path.count != 0 && gates.contains(point) { continue }
//        if result.weight < weight { continue }
//        
//        path.append(point)
//        if summits.contains(point) {
//            if result.summit > point { result = (point, weight)}
//            continue
//        }
//        
//        map[point]!.forEach {
//            needVisit.append($0.des)
//            weights.append(max(weight, $0.weight))
//            visitedPaths.append(path)
//        }
//    }
//    
//    return [result.summit, result.weight]
//}

// MARK: - n차
// MARK: 시간초과

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//
//    var result: (summit: Int, weight: Int) = (Int.max, Int.max)
//    var possiblePaths: [[Int]] = []
//
//    var map: [Int: [(des: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//
//    var needVisit = gates
//    var visitedPaths = Array(repeating: [Int](), count: gates.count)
//    while !needVisit.isEmpty {
//        let point = needVisit.removeLast()
//        var path = visitedPaths.removeLast()
//
//        if path.contains(point) { continue }
//        if path.count != 0 && gates.contains(point) { continue }
//
//        path.append(point)
//        if summits.contains(point) {
//            possiblePaths.append(path)
//            continue
//        }
//
//        map[point]!.forEach {
//            needVisit.append($0.des)
//            visitedPaths.append(path)
//        }
//    }
//
//    for path in possiblePaths {
//        var maxWeight = 0
//        for i in 0..<path.count - 1 {
//            let p = Set([path[i], path[i+1]])
//            let pathIndex = paths.firstIndex(where: { Set($0[0..<2]) == p })!
//            maxWeight = max(maxWeight, paths[pathIndex][2])
//        }
//        if maxWeight < result.weight { result = (path.last!, maxWeight) }
//        else if maxWeight == result.weight {
//            if path.last! < result.summit { result = (path.last!, maxWeight) }
//        }
//    }
//
//    return [result.summit, result.weight]
//}



// MARK: - n차
// MARK: 시간초과

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//
//    var result: (summit: Int, weight: Int) = (Int.max, Int.max)
//    var possiblePaths: [[Int]] = []
//
//    var map: [Int: [(des: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//
//    var dGates = gates
//    while !dGates.isEmpty {
//        let gate = dGates.removeLast()
//        let otherGates = gates.filter { $0 != gate }
//
//        var needVisit = [gate]
//        var usingPaths = [[Int]()]
//        while !needVisit.isEmpty {
//            let point = needVisit.removeLast()
//            var path = usingPaths.removeLast()
//
//            if path.contains(point) || otherGates.contains(point) { continue }
//
//            path.append(point)
//            if summits.contains(point) {
//                possiblePaths.append(path)
//                continue
//            }
//            map[point]!.forEach {
//                needVisit.append($0.des)
//                usingPaths.append(path)
//            }
//        }
//    }
//
//    for path in possiblePaths {
//        var maxWeight = 0
//        for i in 0..<path.count - 1 {
//            let p = Set([path[i], path[i+1]])
//            let pathIndex = paths.firstIndex(where: { Set($0[0..<2]) == p })!
//            maxWeight = max(maxWeight, paths[pathIndex][2])
//        }
//        if maxWeight < result.weight { result = (path.last!, maxWeight) }
//        else if maxWeight == result.weight {
//            if path.last! < result.summit { result = (path.last!, maxWeight) }
//        }
//    }
//
//    return [result.summit, result.weight]
//}


// MARK: - n차
// MARK: 실패 & 시간초과
//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//
//    var result: (summit: Int, weight: Int) = (Int.max, Int.max)
//
//    var map: [Int: [(des: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//
//    var dGates = gates
//    while !dGates.isEmpty {
//        let gate = dGates.removeLast()
//
//        guard map[gate]!.allSatisfy({ $0.weight <= result.weight }) else { continue }
//
//        var dSummits = summits
//        while !dSummits.isEmpty {
//            let summit = dSummits.removeLast()
//
//            guard map[summit]!.allSatisfy({ $0.weight <= result.weight }) else { continue }
//
//            let otherGates = gates.filter { $0 != gate }
//            let otherSummits = summits.filter { $0 != summit }
//
//            var needVisit: [Int] = [gate]
//            var weights: [Int] = [0]
//            var visited: [Int] = []
//            var localMax = 0
//            while !needVisit.isEmpty {
//                let currentPoint = needVisit.removeLast()
//                let currentWeight = weights.removeLast()
//
//                if (visited + otherGates + otherSummits).contains(currentPoint) { continue }
//                if result.weight < currentWeight { continue }
//
//                localMax = max(localMax, currentWeight)
//                if currentPoint == summit {
////                    result = (summit, localMax)
//                    result = result.summit < summit ? result : (summit, localMax)
//                    localMax = 0
//                    continue
//                }
//
//                visited.append(currentPoint)
//                needVisit += map[currentPoint]!.map { $0.des }
//                weights += map[currentPoint]!.map { $0.weight }
//            }
//        }
//    }
//
//    return [result.summit, result.weight]
//}

//print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
//print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2,3,4]))
//print(solution(7, [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]], [3, 7], [1,5]))



// XX산의 지점 수 n
// 각 등산로의 정보를 담은 2차원 정수 배열 paths
// 출입구들의 번호가 담긴 정수 배열 gates
// 산봉우리들의 번호가 담긴 정수 배열 summits

// 이때, intensity가 최소가 되는 등산코스에 포함된 산봉우리 번호와 intensity의 최솟값을 차례대로 정수 배열에 담아 return 하도록 solution 함수를 완성해주세요
// intensity가 최소가 되는 등산코스가 여러 개라면 그중 산봉우리의 번호가 가장 낮은 등산코스를 선택합니다

// 'g': gate
// 'r': rest
// 's': summit

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//    
//    var map: [Int: [(des: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//    
//    var result = (summit: 0, weight: Int.max)
////    var possibleResult: [(summit: Int, weight: Int)] = []
//    
//    var copiedGates = gates
//    while !copiedGates.isEmpty {
//        var gate = copiedGates.removeLast()
//        
//        var copiedSummits = summits
//        while !copiedSummits.isEmpty {
//            var summit = copiedSummits.removeLast()
//            
//            var otherGates = gates
//            var otherSummits = summits
//            otherGates.remove(at: gates.firstIndex(of: gate)!)
//            otherSummits.remove(at: summits.firstIndex(of: summit)!)
//            
//            var possiblePointsMap = map.filter {
//                return !otherGates.contains($0.key) && !otherSummits.contains($0.key)
//            }
//            
//            var needVisit = [gate]
//            var weights: [Int] = [0]
//            var localMax = 0
//            var paths: [[Int]] = [[Int]()]
//            var visited: [Int] = []
//            while !needVisit.isEmpty {
//                var currentPoint = needVisit.removeLast()
//                var currentWeight = weights.removeLast()
//                var currentPath = paths.removeLast()
//                
//                if result.weight < currentWeight { continue }
//                if (currentPath + otherGates + otherSummits).contains(currentPoint) { continue }
//                
//                currentPath.append(currentPoint)
//                localMax = max(localMax, currentWeight)
////                print("needVisit: \(needVisit), currentPath: \(currentPath)")
//                if currentPoint == summit {
////                    possiblePaths.append(currentPath)
////                    possibleResult.append((summit, localMax))
//                    result = (summit, localMax)
//                    localMax = 0
//                    continue
//                }
//                
//                visited.append(currentPoint)
//                possiblePointsMap[currentPoint]!.forEach {
//                    needVisit.append($0.des)
//                    weights.append($0.weight)
//                    paths.append(currentPath)
//                }
//            }
//            
//            
//        }
//    }
//    print(possiblePaths)
//    print(possibleResult)
//    possibleResult.sort(by: {
//        if $0.weight < $1.weight { return true }
//        else if $0.weight == $1.weight { return $0.summit < $1.summit }
//        else { return false }
//    })
    
//    return [result.summit, result.weight]
//}






//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//
//    var map: [Int: [(des: Int, weight: Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//
//    var possibleChoices: [(summit: Int, weight: Int)] = []
//
//    var gates = gates
//    while !gates.isEmpty {
//        var gate = gates.removeFirst()
//
//        var summits = summits
//        while !summits.isEmpty {
//            var summit = summits.removeFirst()
//            var maxWeight = 0
//            print("gate: \(gate), summit: \(summit)")
//
//
//
//            var needVisit: [(point: Int, weight: Int)] = [(gate, 0)]
//            var visited: [Int] = []
//            while !needVisit.isEmpty {
//                var (currentPoint, weight) = needVisit.removeLast()
//                if visited.contains(currentPoint) || gates.contains(currentPoint) { continue }
//                print("currentPoint: \(currentPoint)")
//                maxWeight = max(maxWeight, weight)
//                if currentPoint == summit {
//                    print("정상 !, maxWeight: \(maxWeight)")
//                    possibleChoices.append((summit, maxWeight))
//                    maxWeight = 0
//                    continue
//                }
//                print("needVisit: \(needVisit)", "currentPoint: \(currentPoint)", "maxWeight: \(maxWeight)")
//                needVisit += map[currentPoint]!.map { ($0.des, $0.weight) }
//                visited.append(currentPoint)
//            }
//        }
//    }
//
//    print(possibleChoices)
//
//    return []
//}

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//
////     let rests = Array(1..<n+1).map { $0 }
////         .filter { !gates.contains($0) }
////         .filter { !summits.contains($0) }
//
////     var types: [String: [Int]] = ["g": gates, "r": rests, "s": summits]
//    var map: [Int: [(Int, Int)]] = [:]
//    for i in 1..<n+1 { map[i] = [] }
//
//    paths.forEach { path in
//        map[path[0]]!.append((path[1], path[2]))
//        map[path[1]]!.append((path[0], path[2]))
//    }
//
//
//    var gates = gates
//
//    var possibleChoices: [(Int, Int)] = []
//
//
//    while !gates.isEmpty {
//        let gate = gates.removeFirst()
//        var summits = summits
//
//        while !summits.isEmpty {
//            var needVisit: [(Int, Int)] = []
//            var weights: [Int] = []
//            var visited: [Int] = []
//
//            let summit = summits.removeFirst()
////            var pathMax = 0
//            print("gate: \(gate), summit: \(summit)")
//            while !needVisit.isEmpty {
//                var (currentPoint, currentMaxWeight) = needVisit.removeLast()
//                let currentWeight = weights.removeLast()
//                print("needVisit: \(needVisit)" ,"currentPoint: \(currentPoint)")
//                if visited.contains(currentPoint) || gates.contains(currentPoint) { continue }
//                if currentPoint == summit { continue }
//                currentMaxWeight = max(currentMaxWeight, currentWeight)
//                visited.append(currentPoint)
//                needVisit += map[currentPoint]!.map { ($0.0, currentMaxWeight) }
//                weights += map[currentPoint]!.map { $0.1 }
//            }
//            print("-------")
//            possibleChoices.append((pathMax, summit))
//        }
//    }
//
//    print(possibleChoices)
//
//    return []
//}

//print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
//print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2,3,4]))
//print(solution(7, [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]], [3, 7], [1,5]))

//struct PriorityQueue {
//
//}

//func solution(_ n: Int, _ paths: [[Int]], _ gates: [Int], _ summits: [Int]) -> [Int] {
//
//    var pathMap: [Int: [(des: Int, offset: Int)]] = [:]
//    for i in 0..<n+1 { pathMap[i] = [] }
//
//    for path in paths {
//        let src = path[0]
//        let dest = path[1]
//        let offset = path[2]
//        pathMap[src]!.append((dest, offset))
//        pathMap[dest]!.append((src, offset))
//    }
//
//    var queue: [(des: Int, offset: Int)] = []
//    func insertQueue(dataArray: [(des: Int, offset: Int)]) {
//        queue += dataArray
//        queue.sort(by: { $0.offset < $1.offset })
//    }
//    queue += gates.map { ($0, 0) }
//
//    var dij: [Int] = .init(repeating: 0, count: n+1)
//
//    while !queue.isEmpty {
//        let path = queue.removeFirst()
//        let dest = path.des
//        let offset = path.offset
////        if dij[dest] <= offset { continue }
//        dij[dest] = offset
//
//        if summits.contains(dest) { continue }
//        insertQueue(dataArray: pathMap[dest]!)
//    }
//
//    var result = Int.max
//    for summit in summits {
//        result = min(result, dij[summit])
//    }
//    print(dij)
//
//    return []
//}


//func solution(_ n: Int, _ paths: [[Int]], _ gates: [Int], _ summits: [Int]) -> [Int] {
//
//    var result: [Int] = [0, Int.max]
//
//    var pathMap: [Int: [(des: Int, offset: Int)]] = [:]
//    for i in 0..<n+1 { pathMap[i] = [] }
//
//    for path in paths.sorted(by: { $0[2] < $1[2] }) {
//        let src = path[0]
//        let dest = path[1]
//        let offset = path[2]
//        pathMap[src]!.append((dest, offset))
//        pathMap[dest]!.append((src, offset))
//    }
//
//    let sortedSummits = summits.sorted()
//    func dfs(summitIndex: Int) -> Int? {
//        var visited: [Int] = []
//        var summits = sortedSummits
//        let start = summits.remove(at: summitIndex)
//
//        var maxOffset = 0
//
//        func recur(currentPos: Int, currentOffset: Int) -> Int? {
//            /// 이미 갔던 곳 || 또 다른 봉우리
//            if visited.contains(currentPos) || summits.contains(currentPos) { return nil }
//
//            maxOffset = max(maxOffset, currentOffset)
//            visited.append(currentPos)
//            if maxOffset > result[1] { return nil }
//
//            /// 게이트에 도달
//            if gates.contains(currentPos) { return maxOffset }
//
//            for path in pathMap[currentPos]! {
//                guard let maxOffset = recur(currentPos: path.des, currentOffset: path.offset)
//                else { continue }
//                return maxOffset
//            }
//            return nil
//        }
//
//        return recur(currentPos: start, currentOffset: 0)
//    }
//
//    var minPathOffset = Int.max
//    for (index, summit) in sortedSummits.enumerated() {
//        let currentMin = dfs(summitIndex: index) ?? Int.max
//
//        if minPathOffset <= currentMin { continue }
//        else {
//            minPathOffset = currentMin
//            result = [summit, currentMin]
//        }
//    }
//
//    return result
//}



//func solution(_ n: Int, _ paths: [[Int]], _ gates: [Int], _ summits: [Int]) -> [Int] {
//
//    /// 기본 설정
//    var pathMap: [Int: [(des: Int, offset: Int)]] = [:]
//    for i in 0..<n+1 { pathMap[i] = [] }
//
//    for path in paths.sorted(by: { $0[2] < $1[2] }) {
//        let src = path[0]
//        let dest = path[1]
//        let offset = path[2]
//        pathMap[src]!.append((dest, offset))
//        pathMap[dest]!.append((src, offset))
//    }
//
//
//    /// dijkstra
//    var q: [(index: Int, maxOffset: Int)] = gates.map { ($0, 0) }
//    var dij: [Int] = .init(repeating: 10000001, count: n+1)
//
//    while !q.isEmpty {
//        let node = q.removeFirst()
//
//        if node.maxOffset < dij[node.index] { dij[node.index] = node.maxOffset }
//        else { continue }
//
//        if summits.contains(node.index)
//            || (gates.contains(node.index) && node.maxOffset > 0){ continue }
//
//        let nextPoints: [(index: Int, maxOffset: Int)] = pathMap[node.index]!
//            .map { des, offset in
//                return (des, max(offset, node.maxOffset))
//            }
//        q += nextPoints
//    }
//
//    var result: [Int] = [0, 10000001]
//    for summit in summits {
//        if result[1] <= dij[summit] { continue }
//        else { result = [summit, dij[summit]] }
//    }
//
//    return result
//}



struct Heap {
    var data: [(index: Int, maxOffset: Int)]
    
    init() {
        self.data = [(-1, -1)]
    }
}

extension Heap {
    mutating func push(index: Int, maxOffset: Int) {
        let node = (index, maxOffset)
        data.append(node)
        
        var nodeIndex = data.count - 1
        var parentIndex = nodeIndex / 2
        while data[parentIndex].maxOffset < maxOffset && parentIndex >= 1 {
            data.swapAt(parentIndex, nodeIndex)
            parentIndex /= 2
            nodeIndex = parentIndex
        }
    }
    
    mutating func pop() -> (index: Int, maxOffset: Int) {
        data.swapAt(1, data.count - 1)
        let returnValue = data.removeLast()
        
        var index = 1
        var leftChild: Int { index * 2 }
        var rightChild: Int { index * 2 + 1 }
        
        while true {
            if leftChild >= data.count { break }
            if rightChild >= data.count {
                if data[index].maxOffset > data[leftChild].maxOffset {
                    data.swapAt(index, leftChild)
                }
                break
            }
            
            if data[index].maxOffset < data[leftChild].maxOffset && data[index].maxOffset < data[rightChild].maxOffset {
                break
            }
            
            if data[index].maxOffset > data[leftChild].maxOffset && data[index].maxOffset > data[rightChild].maxOffset {
                if data[leftChild].maxOffset > data[rightChild].maxOffset {
                    data.swapAt(index, leftChild)
                    index = leftChild
                } else {
                    data.swapAt(index, rightChild)
                    index = rightChild
                }
                
                continue
            }
            
            if data[leftChild].maxOffset > data[rightChild].maxOffset {
                data.swapAt(index, leftChild)
                index = leftChild
            } else {
                data.swapAt(index, rightChild)
                index = rightChild
            }
        }
        
        return returnValue
    }
    
    mutating func isEmpty() -> Bool {
        if data.count <= 1 { return true }
        else { return false }
    }
}


func solution(_ n: Int, _ paths: [[Int]], _ gates: [Int], _ summits: [Int]) -> [Int] {
    
    var result: [Int] = [0, 10000001]
    
    /// 기본 설정
    var pathMap: [Int: [(index: Int, offset: Int)]] = [:]
    for i in 0..<n+1 { pathMap[i] = [] }
    
    for path in paths {
        let src = path[0]
        let dest = path[1]
        let offset = path[2]
        pathMap[src]!.append((dest, offset))
        pathMap[dest]!.append((src, offset))
    }
    
    let sortedSummits = Set(summits)
    
    /// dijkstra
    var heap: Heap = .init()
    for gate in gates { heap.push(index: gate, maxOffset: 0) }
    var dij: [Int] = .init(repeating: 10000001, count: n+1)
    
    while !heap.isEmpty() {
        let node = heap.pop()
        
        if sortedSummits.contains(node.index) {
            if result[1] > node.maxOffset { result = [node.index, node.maxOffset] }
            else if result[1] == node.maxOffset { result[0] = min(result[0], node.index) }
            continue
        }
        if node.maxOffset > dij[node.index] { continue }
        
        for dest in pathMap[node.index]! {
            let maxOffset = max(dest.offset, node.maxOffset)
            if maxOffset < dij[dest.index] {
                dij[dest.index] = maxOffset
                heap.push(index: dest.index, maxOffset: maxOffset)
            }
        }
    }
    
    
    return result
}

//print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
//print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2, 3, 4]))
//print(solution(7, [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]], [3, 7], [1, 5]))
//print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [2], [3, 4]))
