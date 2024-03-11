//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/16/24.
//

import Foundation

//enum Direction {
//    case right
//    case down
//    case left
//}
//
//struct Shape: Equatable {
//    let directions: [Direction]
//    
//    static func == (lhs: Shape, rhs: Shape) -> Bool {
//        return lhs.directions == rhs.directions
//    }
//}
//
//func solution(_ board: [[Int]]) -> Int {
//    
//    let removable: [Shape] = [
//        .init(directions: [.down, .down, .right]),
//        .init(directions: [.down, .down, .left]),
//        .init(directions: [.down, .right, .right]),
//        .init(directions: [.down, .right, .left]),
//        .init(directions: [.down, .left, .left])
//    ]
//    let dx = [1, -1, 0]
//    let dy = [0, 0, 1]
//    
//    let height: Int = board.count
//    let width: Int = board.first!.count
//    
//    var impossibleXs: Set<Int> = .init()
//    
//    func isRemovable(y: Int, x: Int) -> (Bool, Set<Int>) {
//        let num = board[y][x]
//        var directions: [Direction] = []
//        var visited: [(y: Int, x: Int)] = []
//        var visitedX: Set<Int> = .init()
//        func recur(y: Int, x: Int) {
////            print(y, x)
////            print(directions)
////            print(visited)
//            visited.append((y, x))
//            visitedX.insert(x)
//            for i in 0..<3 {
//                let nx = x + dx[i]
//                let ny = y + dy[i]
//                
//                if (ny < 0) || (ny >= height) || (nx < 0) || (nx >= width) { continue }
//                if visited.contains(where: { $0.y == ny && $0.x == nx }) { continue }
//                
//                if board[ny][nx] == num {
////                    print("origin: \(y), \(x), order: \(i) - new", ny, nx)
//                    switch i {
//                    case 0: directions.append(.right)
//                    case 1: directions.append(.left)
//                    case 2: directions.append(.down)
//                    default: continue
//                    }
//                    recur(y: ny, x: nx)
//                }
//            }
//        }
//        recur(y: y, x: x)
//        if !impossibleXs.intersection(visitedX).isEmpty { return (false, visitedX)}
//        return (removable.contains(.init(directions: directions)), visitedX)
//    }
//    
//    
//    var removableCount: Int = 0
//    for y in 0..<height {
//        for x in 0..<width {
//            guard board[y][x] != 0 && !impossibleXs.contains(x) else { continue }
//            let (isRemovable, visitedX) = isRemovable(y: y, x: x)
//            if !isRemovable {
//                impossibleXs.formUnion(visitedX)
//                continue
//            }
//            print(y, x)
//            removableCount += 1
//        }
//    }
//    
//    return removableCount
//}




//enum Direction {
//    case right
//    case down
//    case left
//}
//
//struct Shape: Equatable, Hashable {
//    let id: Int
//    let minX: Int
//    let maxX: Int
//    let minY: Int
//    let maxY: Int
//    let directions: [Direction]
//    
//    static func == (lhs: Shape, rhs: Shape) -> Bool {
//        return lhs.directions == rhs.directions
//    }
//}

//func solution(_ board: [[Int]]) -> Int {
//    
//    var board = board
//    let removableShape: Set<[Direction]> = [
//        [.down, .down, .right],
//        [.down, .down, .left],
//        [.down, .right, .right],
//        [.down, .right, .left],
//        [.down, .left, .left]
//    ]
//    let dx = [1, -1, 0]
//    let dy = [0, 0, 1]
//    
//    let height: Int = board.count
//    let width: Int = board.first!.count
//    
//    func configureShape(y: Int, x: Int) -> Shape {
//        let num = board[y][x]
//        var directions: [Direction] = []
//        var visited: [(y: Int, x: Int)] = []
//        func recur(y: Int, x: Int) {
//            visited.append((y, x))
//            for i in 0..<3 {
//                let nx = x + dx[i]
//                let ny = y + dy[i]
//                
//                if (ny < 0) || (ny >= height) || (nx < 0) || (nx >= width) { continue }
//                if visited.contains(where: { $0.y == ny && $0.x == nx }) { continue }
//                
//                if board[ny][nx] == num {
//                    switch i {
//                    case 0: directions.append(.right)
//                    case 1: directions.append(.left)
//                    case 2: directions.append(.down)
//                    default: continue
//                    }
//                    recur(y: ny, x: nx)
//                }
//            }
//        }
//        recur(y: y, x: x)
//        let xs = visited.map { $0.x }
//        let ys = visited.map { $0.y }
//        return .init(id: num,
//                     minX: xs.min()!,
//                     maxX: xs.max()!,
//                     minY: ys.min()!,
//                     maxY: ys.max()!,
//                     directions: directions)
//    }
//    
//    func removeBlockUnder(shape: Shape) {
//        for y in shape.maxY + 1 ..< height {
//            for x in shape.minX ..< shape.maxX {
////                board[y][x] = 0
//            }
//        }
//    }
//    
//    
//    
//    var configuredShapeId: Set<Int> = []
//    
//    var unremovable: [Shape] = []
//    for y in 0..<height {
//        for x in 0..<width {
//            let num = board[y][x]
//            guard num != 0 && !configuredShapeId.contains(num) else { continue }
//            
//            let shape = configureShape(y: y, x: x)
//            if !removableShape.contains(shape.directions) {
//                unremovable.append(shape)
//                configuredShapeId.insert(num)
//            }
//        }
//    }
//    print(unremovable)
//    
//    for ur in unremovable {
//        removeBlockUnder(shape: ur)
//    }
//    
//    for r in board { print(r) }
//    
//    var result = 0
//    for y in 0..<height {
//        for x in 0..<width {
//            let num = board[y][x]
//            guard num != 0 && !configuredShapeId.contains(num) else { continue }
//            
//            let shape = configureShape(y: y, x: x)
//            if removableShape.contains(shape.directions) {
//                result += 1
//            }
//        }
//    }
//    
//    
//    var shapes: Set<Shape> = []
//    var impossibleShapes: [Shape] = []
//    var configuredShapeId: Set<Int> = []
//    for y in 0..<height {
//        for x in 0..<width {
//            let num = board[y][x]
//            guard num != 0 && !configuredShapeId.contains(num) else { continue }
//            
//            let shape = configureShape(y: y, x: x)
//            shapes.insert(shape)
//            configuredShapeId.insert(shape.id)
//            if !removable.contains(shape.directions) {
//                
//            }
//        }
//    }
//    print(shapes)
//    
//    return result
//}

enum Direction {
    case right
    case left
    case down
}

struct Shape: Equatable, Hashable {
    let id: Int
    let minX: Int
    let maxX: Int
    let minY: Int
    let maxY: Int
    let directions: [Direction]
    
    static func == (lhs: Shape, rhs: Shape) -> Bool {
        return lhs.directions == rhs.directions
    }
}

func solution(_ board: [[Int]]) -> Int {
    
    let height = board.count
    let width = board.first!.count
    
    func configureShape(y: Int, x: Int) -> Shape {
        let dy = [0,0,1]
        let dx = [1,-1,0]
        let num = board[y][x]
        var directions: [Direction] = []
        var visited: [(y: Int, x: Int)] = []
        func recur(y: Int, x: Int) {
            for i in 0..<3 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                guard (ny >= 0) && (ny < height) && (nx >= 0) && (nx < width) else { continue }
                guard !visited.contains(where: { $0.y == y && $0.x == x}) else { continue }
                guard board[ny][nx] == num else { continue }
                
                visited.append((y, x))
                switch i {
                case 0: directions.append(.right)
                case 1: directions.append(.left)
                case 2: directions.append(.down)
                default: continue
                }
                recur(y: ny, x: nx)
            }
        }
        recur(y: y, x: x)
        let ys = visited.map { $0.y }
        let xs = visited.map { $0.x }
        return .init(id: num,
                     minX: xs.min()!,
                     maxX: xs.max()!,
                     minY: ys.min()!,
                     maxY: ys.max()!,
                     directions: directions)
    }
    
    
    var configuredNum: Set<Int> = []
    for y in 0..<height {
        for x in 0..<width {
            let num = board[y][x]
            guard num != 0 && !configuredNum.contains(num) else { continue }
            print(y, x)
            print(configureShape(y: y, x: x))
        }
    }
    
    
    return 0
}


//print(solution([
//    [0,0,0,0,0,0,0,0,0,0],
//    [0,0,0,0,0,0,0,0,0,0],
//    [0,0,0,0,0,0,0,0,0,0],
//    [0,0,0,0,0,0,0,0,0,0],
//    [0,0,0,0,0,0,4,0,0,0],
//    [0,0,0,0,0,4,4,0,0,0],
//    [0,0,0,0,3,0,4,0,0,0],
//    [0,0,0,2,3,0,0,0,5,5],
//    [1,2,2,2,3,3,0,0,0,5],
//    [1,1,1,0,0,0,0,0,0,5]
//]))
//
//print(solution([[0, 0, 1, 1, 1], [0, 0, 0, 1, 0], [3, 0, 0, 2, 0], [3, 2, 2, 2, 0], [3, 3, 0, 0, 0]]))
