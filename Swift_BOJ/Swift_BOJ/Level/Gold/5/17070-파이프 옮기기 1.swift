//
//  17070-파이프 옮기기 1.swift
//  Swift_BOJ
//
//  Created by 이성민 on 6/5/24.
//

import Foundation

//struct Queue<Element> {
//    var head: [Element] = []
//    var tail: [Element] = []
//
//    mutating func push(_ element: Element) {
//        tail.append(element)
//    }
//
//    mutating func pop() -> Element {
//        if head.isEmpty {
//            while !tail.isEmpty {
//                head.append(tail.removeLast())
//            }
//        }
//        return head.removeLast()
//    }
//
//    var isEmpty: Bool {
//        return head.isEmpty && tail.isEmpty
//    }
//}
//
//struct Pos {
//    let y: Int
//    let x: Int
//
//    init(_ y: Int, _ x: Int) {
//        self.y = y
//        self.x = x
//    }
//
//    func toRight() -> Pos { .init(y, x + 1) }
//    func toDown() -> Pos { .init(y + 1, x) }
//    func toDiag() -> Pos { .init(y + 1, x + 1) }
//}
//
//struct Pipe {
//    var s: Pos
//    var e: Pos
//
//    enum Status {
//        case hor
//        case ver
//        case diag
//    }
//
//    var status: Status {
//        if s.y == e.y && s.x != e.x { return .hor }
//        else if s.y != e.y && s.x == e.x { return .ver }
//        else { return .diag }
//    }
//}
//
//func solution() -> Int {
//
//    let n = Int(readLine()!)!
//
//    var map: [[Int]] = [.init(repeating: 1, count: n+2)]
//    for _ in 0..<n {
//        map.append([1] + readLine()!.split(separator: " ").map { Int($0)! } + [1])
//    }
//    map.append(.init(repeating: 1, count: n+2))
//
//    var memo: [[(hor: Int, ver: Int, diag: Int)]] = .init(
//        repeating: .init(repeating: (0, 0, 0), count: n),
//        count: n
//    )
//    memo[0][1].hor = 1
//
//    func mapVal(of pos: Pos) -> Int {
//        return map[pos.y][pos.x]
//    }
//
//    var queue: Queue<Pipe> = .init()
//    queue.push(.init(s: .init(0, 0), e: .init(0, 1)))
//    while !queue.isEmpty {
//        let pipe = queue.pop()
//
//        let isRightEmpty = mapVal(of: pipe.e.toRight()) == 0
//        let isDownEmpty = mapVal(of: pipe.e.toDown()) == 0
//        let isDiagEmpty = mapVal(of: pipe.e.toDiag()) == 0
//
//        switch pipe.status {
//        case .hor:
//            // 오른쪽 이동 범위 내
//            guard isRightEmpty else { continue }
//
//            let next: Pipe = .init(s: pipe.e, e: pipe.e.toRight())
//            queue.push(next)
//            memo[next.e.y][next.e.x].hor += 1
//
//            if isDownEmpty && isDiagEmpty {
//                let next: Pipe = .init(s: pipe.e, e: pipe.e.toDiag())
//                queue.push(next)
//                memo[next.e.y][next.e.x].diag += 1
//            }
//
//        case .ver:
//            guard isDownEmpty else { continue }
//
//            let next: Pipe = .init(s: pipe.e, e: pipe.e.toDown())
//            queue.push(next)
//            memo[next.e.y][next.e.x].ver += 1
//
//            if isRightEmpty && isDiagEmpty {
//                let next: Pipe = .init(s: pipe.e, e: pipe.e.toDiag())
//                queue.push(next)
//                memo[next.e.y][next.e.x].diag += 1
//            }
//
//        case .diag:
//            if isRightEmpty {
//                let next: Pipe = .init(s: pipe.e, e: pipe.e.toRight())
//                queue.push(next)
//                memo[next.e.y][next.e.x].hor += 1
//            }
//            if isDownEmpty {
//                let next: Pipe = .init(s: pipe.e, e: pipe.e.toDown())
//                queue.push(next)
//                memo[next.e.y][next.e.x].ver += 1
//            }
//            if isRightEmpty && isDownEmpty && isDiagEmpty {
//                let next: Pipe = .init(s: pipe.e, e: pipe.e.toDiag())
//                queue.push(next)
//                memo[next.e.y][next.e.x].diag += 1
//            }
//        }
//    }
//
//    return memo[n-1][n-1].diag + memo[n-1][n-1].hor + memo[n-1][n-1].ver
//}
//
//print(solution())



//struct Pos {
//    let y: Int
//    let x: Int
//
//    func toRight() -> Pos { .init(y: y, x: x+1) }
//    func toDiag() -> Pos { .init(y: y+1, x: x+1) }
//    func toDown() -> Pos { .init(y: y+1, x: x) }
//}
//
//struct Pipe {
//    var s: Pos
//    var e: Pos
//
//    enum Status {
//        case hor
//        case ver
//        case diag
//    }
//
//    var status: Status {
//        if s.y == e.y && s.x != e.x { return .hor }
//        else if s.y != e.y && s.x == e.x { return .ver }
//        else { return .diag }
//    }
//}
//
//func movingPipe1() -> Int {
//
//    var answer: Int = 0
//
//    let n = Int(readLine()!)!
//    var map: [[Int]] = [.init(repeating: 1, count: n+2)]
//    for _ in 0..<n {
//        map.append([1] + readLine()!.split(separator: " ").map { Int($0)! } + [1])
//    }
//    map.append(.init(repeating: 1, count: n+2))
//
//    func mapVal(of pos: Pos) -> Int {
//        return map[pos.y][pos.x]
//    }
//
//    func possibleMoves(from pipe: Pipe) -> [Pipe] {
//        var moves: [Pipe] = []
//
//        let isRightEmpty = mapVal(of: pipe.e.toRight()) == 0
//        let isDownEmpty = mapVal(of: pipe.e.toDown()) == 0
//        let isDiagEmpty = mapVal(of: pipe.e.toDiag()) == 0
//
//        switch pipe.status {
//        case .hor:
//            guard isRightEmpty else { return [] }
//
//            moves.append(.init(s: pipe.e, e: pipe.e.toRight()))
//            if isDiagEmpty && isDownEmpty {
//                moves.append(.init(s: pipe.e, e: pipe.e.toDiag()))
//            }
//
//        case .ver:
//            guard isDownEmpty else { return [] }
//
//            moves.append(.init(s: pipe.e, e: pipe.e.toDown()))
//            if isDiagEmpty && isRightEmpty {
//                moves.append(.init(s: pipe.e, e: pipe.e.toDiag()))
//            }
//
//        case .diag:
//            if isRightEmpty {
//                moves.append(.init(s: pipe.e, e: pipe.e.toRight()))
//            }
//            if isDownEmpty {
//                moves.append(.init(s: pipe.e, e: pipe.e.toDown()))
//            }
//            if isRightEmpty && isDownEmpty && isDiagEmpty {
//                moves.append(.init(s: pipe.e, e: pipe.e.toDiag()))
//            }
//        }
//
//        return moves
//    }
//
//    var needVisit: [Pipe] = [.init(s: .init(y: 1, x: 1), e: .init(y: 1, x: 2))]
//    while !needVisit.isEmpty {
//        let pipe = needVisit.removeLast()
//        if pipe.e.y == n && pipe.e.x == n { answer += 1; continue }
//        needVisit += possibleMoves(from: pipe)
//    }
//
//    return answer
//}
//
//print(movingPipe1())



func movingPipe1() -> Int {
    
    let n = Int(readLine()!)!
    var map: [[Int]] = []
    for _ in 0..<n {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    // memo[y좌표][x좌표][방향]의 경우의 수
    // 0: 가로 / 1: 대각선 / 2: 세로
    var memo: [[[Int]]] = .init(repeating: .init(repeating: [0, 0, 0], count: n), count: n)
    for x in 1..<n {
        guard map[0][x] != 1 else { break }
        memo[0][x][0] = 1
    }
    
    for y in 1..<n {
        for x in 2..<n {
            guard map[y][x] != 1 else { continue }
            memo[y][x][0] = memo[y][x-1][0] + memo[y][x-1][1]
            memo[y][x][2] = memo[y-1][x][1] + memo[y-1][x][2]
            
            if map[y-1][x] != 1 && map[y][x-1] != 1 {
                memo[y][x][1] = memo[y-1][x-1][0] + memo[y-1][x-1][1] + memo[y-1][x-1][2]
            }
        }
    }
    
    
    return memo[n-1][n-1][0] + memo[n-1][n-1][1] + memo[n-1][n-1][2]
}

print(movingPipe1())
