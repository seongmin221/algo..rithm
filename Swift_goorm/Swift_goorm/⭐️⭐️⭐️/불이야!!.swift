//
//  불이야!!.swift
//  Swift_goorm
//
//  Created by 이성민 on 6/14/24.
//

import Foundation

struct Pos {
    let y: Int
    let x: Int
    
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

struct Queue<E> {
    var head: [E] = []
    var tail: [E] = []
    
    var isEmpty: Bool { head.isEmpty && tail.isEmpty }
}

extension Queue {
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

func fire() {
    let dy: [Int] = [-1, 1, 0, 0]
    let dx: [Int] = [0, 0, -1, 1]

    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let r = input[0]
    let c = input[1]

    var goorm: Pos = .init(0, 0)
    var onFire: [Pos] = []
    var timeMap: [[Int]] = .init(repeating: .init(repeating: .max, count: c), count: r)
    for y in 0..<r {
        let input = readLine()!.map { String($0) }
        for x in 0..<c {
            switch input[x] {
            case "#": timeMap[y][x] = -1
            case "&": goorm = .init(y, x)
            case "@": onFire.append(.init(y, x))
            default: continue
            }
        }
    }
    timeMap[goorm.y][goorm.x] = 0

    var q: Queue<Pos> = .init()
    q.push(goorm)

    while !q.isEmpty {
        let pos = q.pop()
        
        for i in 0..<4 {
            let ny = pos.y + dy[i]
            let nx = pos.x + dx[i]
            guard (0 <= ny && ny < r), (0 <= nx && nx < c) else { continue }
            
            let time = timeMap[pos.y][pos.x]
            let nTime = timeMap[ny][nx]
            if time + 1 < nTime {
                timeMap[ny][nx] = time + 1
                q.push(.init(ny, nx))
            }
        }
    }

    var result: Int = .max
    for pos in onFire {
        guard result > timeMap[pos.y][pos.x] else { continue }
        result = timeMap[pos.y][pos.x]
    }

    print(result == .max ? -1 : result-1)
}

//import Foundation
//
//struct Pos {
//    let y: Int
//    let x: Int
//
//    init(_ y: Int, _ x: Int) {
//        self.y = y
//        self.x = x
//    }
//}
//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let r = input[0]
//let c = input[1]
//
//var goorm: Pos = .init(0, 0)
//var onFire: [Pos] = []
//var timeMap: [[Int]] = .init(repeating: .init(repeating: .max, count: c), count: r)
//for y in 0..<r {
//    let input = readLine()!.map { String($0) }
//    for x in 0..<c {
//        switch input[x] {
//        case "#": timeMap[y][x] = -1
//        case "&": goorm = .init(y, x)
//        case "@": onFire.append(.init(y, x))
//        default: continue
//        }
//    }
//}
//timeMap[goorm.y][goorm.x] = 0
//
//func timeAt(_ pos: Pos) -> Int {
//    return timeMap[pos.y][pos.x]
//}
//
//func move(from pos: Pos) {
//    let dy: [Int] = [-1, 1, 0, 0]
//    let dx: [Int] = [0, 0, -1, 1]
//
//    for i in 0..<4 {
//        let ny = pos.y + dy[i]
//        let nx = pos.x + dx[i]
//        guard 0 <= ny && ny < r, 0 <= nx && nx < c else { continue }
//
//        let nPos: Pos = .init(ny, nx)
//        let time = timeAt(pos)
//        let nTime = timeAt(nPos)
//        if time + 1 < nTime {
//            timeMap[nPos.y][nPos.x] = time + 1
//            move(from: nPos)
//        }
//    }
//}
//
//move(from: goorm)
//
//var result: Int = .max
//for pos in onFire {
//    result = min(result, timeAt(pos))
//}
//
//print(result == .max ? -1 : result-1)

