//
//  2636-치즈.swift
//  Swift_BOJ
//
//  Created by 이성민 on 6/10/24.
//

import Foundation

//struct Pos: Hashable {
//    let y: Int
//    let x: Int
//
//    init(_ y: Int, _ x: Int) {
//        self.y = y
//        self.x = x
//    }
//}
//
//func cheese() -> (Int, Int) {
//
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let maxY = input[0]
//    let maxX = input[1]
//
//    var cheese: [[Int]] = []
//    for _ in 0..<maxY {
//        cheese.append(readLine()!.split(separator: " ").map { Int($0)! })
//    }
//
//    var hours: Int = 0
//    var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: maxX), count: maxY)
//
//    func around(_ y: Int, _ x: Int) -> (blank: [Pos], edge: [Pos]) {
//        var blank: [Pos] = []
//        var edge: [Pos] = []
//        if y-1 >= 0 {
//            cheese[y-1][x] == 0 ? blank.append(.init(y-1, x)) : edge.append(.init(y-1, x))
//        }
//        if x-1 >= 0 {
//            cheese[y][x-1] == 0 ? blank.append(.init(y, x-1)) : edge.append(.init(y, x-1))
//        }
//        if y+1 < maxY {
//            cheese[y+1][x] == 0 ? blank.append(.init(y+1, x)) : edge.append(.init(y+1, x))
//        }
//        if x+1 < maxX {
//            cheese[y][x+1] == 0 ? blank.append(.init(y, x+1)) : blank.append(.init(y, x+1))
//        }
//        print("\(y), \(x) - \(blank) ---- \(edge)")
//        return (blank, edge)
//    }
//
//    func findCheeseEdge(_ y: Int, _ x: Int) -> Set<Pos> {
//        var edges: Set<Pos> = []
//        var needVisit: [Pos] = [.init(y, x)]
//        while !needVisit.isEmpty {
//            let pos = needVisit.removeLast()
//
//            if visited[pos.y][pos.x] { continue }
//            visited[pos.y][pos.x] = true
//
//            let (next, edge) = around(pos.y, pos.x)
//            needVisit += next
//            edges.formUnion(edge)
//        }
//        return edges
//    }
//
//    print(findCheeseEdge(0, 0).count)
//
//    return ( 0, 0)
//}
//
//cheese()

//struct Pos: Hashable {
//    let y: Int
//    let x: Int
//
//    init(_ y: Int, _ x: Int) {
//        self.y = y
//        self.x = x
//    }
//}
//
//func cheese() {
//
//    var time: Int = 0
//    var lastCount: Int = 0
//
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let maxY = input[0]
//    let maxX = input[1]
//
//    var cheese: [[Int]] = []
//    for _ in 0..<maxY {
//        cheese.append(readLine()!.split(separator: " ").map { Int($0)! })
//    }
//
//    var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: maxX), count: maxY)
//    var cheeseCount: Int = 0
//    for y in 0..<maxY {
//        for x in 0..<maxX {
//            guard cheese[y][x] == 1 else { continue }
//            cheeseCount += 1
//        }
//    }
//
//    func evaluateSurroundings(_ y: Int, _ x: Int) -> (next: [Pos], edge: [Pos]) {
//        var next: [Pos] = []
//        var edge: [Pos] = []
//        if y-1 >= 0 {
//            cheese[y-1][x] == 0
//            ? next.append(.init(y-1, x))
//            : edge.append(.init(y-1, x))
//        }
//        if x-1 >= 0 {
//            cheese[y][x-1] == 0
//            ? next.append(.init(y, x-1))
//            : edge.append(.init(y, x-1))
//        }
//        if y+1 < maxY {
//            cheese[y+1][x] == 0
//            ? next.append(.init(y+1, x))
//            : edge.append(.init(y+1, x))
//        }
//        if x+1 < maxX {
//            cheese[y][x+1] == 0
//            ? next.append(.init(y, x+1))
//            : edge.append(.init(y, x+1))
//        }
//
//        return (next, edge)
//    }
//
//    func findEdges(_ pos: Pos) -> Set<Pos> {
//        var needVisit: [Pos] = [pos]
//        var edges: Set<Pos> = []
//
//        while !needVisit.isEmpty {
//            let pos = needVisit.removeLast()
//
//            if visited[pos.y][pos.x] { continue }
//            visited[pos.y][pos.x] = true
//
//            let (next, edge) = evaluateSurroundings(pos.y, pos.x)
//            needVisit += next
//            edges.formUnion(edge)
//        }
//        lastCount = edges.count
//        return edges
//    }
//
//    func nextStartPos(_ curPos: Pos) -> Pos {
//        var edges: Set<Pos> = findEdges(curPos)
//        for pos in edges {
//            cheese[pos.y][pos.x] = 0
//            cheeseCount -= 1
//        }
//        for row in cheese { print(row) }
//        print("-")
//        return edges.first!
//    }
//
//    var startPos: Pos = .init(0, 0)
//    while cheeseCount > 0 {
//        startPos = nextStartPos(startPos)
//        time += 1
//    }
//
//    print(time)
//    print(lastCount)
//}


struct Queue<E> {
    var head: [E] = []
    var tail: [E] = []
    
    var isEmpty: Bool { head.isEmpty && tail.isEmpty }
    
    mutating func push(_ e: E) {
        tail.append(e)
    }
    
    mutating func pop() -> E {
        if head.isEmpty {
            while !tail.isEmpty {
                head.append(tail.removeLast())
            }
        }
        return head.removeLast()
    }
}

func cheese() {
    let dy: [Int] = [-1, 1, 0, 0]
    let dx: [Int] = [0, 0, 1, -1]
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let maxY = input[0]
    let maxX = input[1]
    
    var cheese: [[Int]] = []
    for _ in 0..<maxY {
        cheese.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    func bfs() -> Int {
        var edges: [(y: Int, x: Int)] = []
        var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: maxX), count: maxY)
        var q: Queue<(y: Int, x: Int)> = .init()
        q.push((0, 0))
        
        while !q.isEmpty {
            let pos = q.pop()
            
            if visited[pos.y][pos.x] == true { continue }
            visited[pos.y][pos.x] = true
            
            for i in 0..<4 {
                let ny = pos.y + dy[i]
                let nx = pos.x + dx[i]
                if 0 <= ny && ny < maxY && 0 <= nx && nx < maxX {
                    cheese[ny][nx] == 1 ? edges.append((ny, nx)) : q.push((ny, nx))
                }
            }
        }
        
        var melted = 0
        for pos in edges {
            guard cheese[pos.y][pos.x] == 1 else { continue }
            cheese[pos.y][pos.x] = 0
            melted += 1
        }
        
        return melted
    }
    
    
    var cheeseCount = 0
    for row in cheese {
        cheeseCount += row.reduce(0, { $0 + $1 })
    }
    
    var time: Int = 0
    var melted: Int = 0
    while true {
        melted = bfs()
        cheeseCount -= melted
        time += 1
        if cheeseCount <= 0 {
            print(time)
            print(melted)
            break
        }
    }
}

//cheese()
