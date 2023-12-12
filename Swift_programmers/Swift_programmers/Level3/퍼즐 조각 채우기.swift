//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/9/23.
//

import Foundation

enum Move {
    case left
    case right
    case down
    case up
}

func solution(_ game_board: [[Int]], _ table: [[Int]]) -> Int {
    
    var board = game_board
    var table = table
    let rowCount = board.count
    let colCount = board.first!.count
    
    func findPiece(start: [Int]) -> Set<[Int]> {
        var piece: [[Int]] = []
        var needVisit = [start]
        var minX = Int.max
        var minY = Int.max
        while !needVisit.isEmpty {
            let pos = needVisit.removeLast()
            guard pos[0] < table.count && pos[1] < table[0].count else { continue }
            guard pos[0] >= 0 && pos[1] >= 0 else { continue }
            guard table[pos[0]][pos[1]] != 0 else { continue }
            table[pos[0]][pos[1]] = 0
            minX = min(minX, pos[1])
            minY = min(minY, pos[0])
            piece.append(pos)
            needVisit.append(pos.left)
            needVisit.append(pos.right)
            needVisit.append(pos.down)
            needVisit.append(pos.up)
        }
        var result: Set<[Int]> = Set()
        piece.forEach {
            var pos = $0
            pos[1] -= minX
            pos[0] -= minY
            result.insert(pos)
        }
        return result
    }
    
    func findBlank(start: [Int]) -> Set<[Int]> {
        var blank: [[Int]] = []
        var needVisit = [start]
        var minX = Int.max
        var minY = Int.max
        while !needVisit.isEmpty {
            let pos = needVisit.removeLast()
            guard pos[0] < board.count && pos[1] < board[0].count else { continue }
            guard pos[0] >= 0 && pos[1] >= 0 else { continue }
            guard board[pos[0]][pos[1]] != 1 else { continue }
            board[pos[0]][pos[1]] = 1
            minX = min(minX, pos[1])
            minY = min(minY, pos[0])
            blank.append(pos)
            needVisit.append(pos.left)
            needVisit.append(pos.right)
            needVisit.append(pos.down)
            needVisit.append(pos.up)
        }
        var result: Set<[Int]> = Set()
        blank.forEach {
            var pos = $0
            pos[1] -= minX
            pos[0] -= minY
            result.insert(pos)
        }
        return result
    }
    
    var pieces: [Set<[Int]>] = []
    var x = 0
    var y = 0
    while y < table.count {
        if table[y][x] == 1 {
            pieces.append(findPiece(start: [y, x]))
        }
        
        x += 1
        if x == colCount {
            x = 0
            y += 1
        }
    }
    
    var blanks: [Set<[Int]>] = []
    x = 0
    y = 0
    while y < board.count {
        if board[y][x] == 0 {
            blanks.append(findBlank(start: [y, x]))
        }
        
        x += 1
        if x == colCount {
            x = 0
            y += 1
        }
    }
    
    var result = 0
    for blank in blanks {
        var isMatched = false
        for (index, piece) in pieces.enumerated() {
            if isMatched { break }
            var p = piece
            let max = p.flatMap({ $0 }).max()!
            var cnt = 0
            while cnt < 4 {
                if isMatched { break }
                if blank.toOrigin() == p.toOrigin() {
                    result += p.count
                    pieces.remove(at: index)
                    isMatched = true
                    break
                }
                p = p.rotate(max)
                cnt += 1
            }
        }
    }
    
    return result
}

extension Array where Element == Int {
    var left: [Int] { return [self[0], self[1] - 1] }
    var right: [Int] { return [self[0], self[1] + 1] }
    var down: [Int] { return [self[0] + 1, self[1]] }
    var up: [Int] { return [self[0] - 1, self[1]] }
}

extension Set where Element == [Int] {
    func rotate(_ maxColNum: Int) -> Self {
        var rotated: Self = Set()
        self.forEach { rotated.insert([$0[1], maxColNum - $0[0]]) }
        return rotated
    }
    
    func toOrigin() -> Self {
        var moved: Self = Set()
        var minX = Int.max
        var minY = Int.max
        self.forEach {
            minX = minX > $0[0] ? $0[0] : minX
            minY = minY > $0[1] ? $0[1] : minY
        }
        self.forEach {
            moved.insert([$0[1] - minY, $0[0] - minX])
        }
        return moved
    }
}



// 1차 - 6,7,8,10 실패
//import Foundation
//
//enum Move {
//    case left
//    case right
//    case down
//    case up
//}
//
//func solution(_ game_board: [[Int]], _ table: [[Int]]) -> Int {
//    
//    var board = game_board
//    var table = table
//    let rowCount = board.count
//    let colCount = board.first!.count
//    
//    func findPiece(start: [Int]) -> Set<[Int]> {
//        var piece: [[Int]] = []
//        var needVisit = [start]
//        var minX = Int.max
//        var minY = Int.max
//        while !needVisit.isEmpty {
//            let pos = needVisit.removeLast()
//            guard pos[0] < table.count && pos[1] < table[0].count else { continue }
//            guard pos[0] >= 0 && pos[1] >= 0 else { continue }
//            guard table[pos[0]][pos[1]] != 0 else { continue }
//            table[pos[0]][pos[1]] = 0
//            minX = min(minX, pos[1])
//            minY = min(minY, pos[0])
//            piece.append(pos)
//            needVisit.append(pos.left)
//            needVisit.append(pos.right)
//            needVisit.append(pos.down)
//            needVisit.append(pos.up)
//        }
//        var result: Set<[Int]> = Set()
//        piece.forEach {
//            var pos = $0
//            pos[1] -= minX
//            pos[0] -= minY
//            result.insert(pos)
//        }
//        return result
//    }
//    
//    func findBlank(start: [Int]) -> Set<[Int]> {
//        var blank: [[Int]] = []
//        var needVisit = [start]
//        var minX = Int.max
//        var minY = Int.max
//        while !needVisit.isEmpty {
//            let pos = needVisit.removeLast()
//            guard pos[0] < board.count && pos[1] < board[0].count else { continue }
//            guard pos[0] >= 0 && pos[1] >= 0 else { continue }
//            guard board[pos[0]][pos[1]] != 1 else { continue }
//            board[pos[0]][pos[1]] = 1
//            minX = min(minX, pos[1])
//            minY = min(minY, pos[0])
//            blank.append(pos)
//            needVisit.append(pos.left)
//            needVisit.append(pos.right)
//            needVisit.append(pos.down)
//            needVisit.append(pos.up)
//        }
//        var result: Set<[Int]> = Set()
//        blank.forEach {
//            var pos = $0
//            pos[1] -= minX
//            pos[0] -= minY
//            result.insert(pos)
//        }
//        return result
//    }
//    
//    var pieces: [Set<[Int]>] = []
//    var x = 0
//    var y = 0
//    while y < table.count {
//        if table[y][x] == 1 {
//            pieces.append(findPiece(start: [y, x]))
//        }
//        
//        x += 1
//        if x == colCount {
//            x = 0
//            y += 1
//        }
//    }
//    
//    var blanks: [Set<[Int]>] = []
//    x = 0
//    y = 0
//    while y < board.count {
//        if board[y][x] == 0 {
//            blanks.append(findBlank(start: [y, x]))
//        }
//        
//        x += 1
//        if x == colCount {
//            x = 0
//            y += 1
//        }
//    }
//    
//    var result = 0
//    for blank in blanks {
//        var isMatched = false
//        for (index, piece) in pieces.enumerated() {
//            if isMatched { break }
//            var p = piece
//            let max = p.flatMap({ $0 }).max()!
//            var cnt = 0
//            while cnt < 4 {
//                if isMatched { break }
//                if blank == p {
//                    result += p.count
//                    pieces.remove(at: index)
//                    isMatched = true
//                    break
//                }
//                p = p.rotate(max)
//                cnt += 1
//            }
//        }
//    }
//    
//    return result
//    
//    
//    
//}
//
//print(solution([[1,1,0,0,1,0],[0,0,1,0,1,0],[0,1,1,0,0,1],[1,1,0,1,1,1],[1,0,0,0,1,0],[0,1,1,1,0,0]], [[1,0,0,1,1,0],[1,0,1,0,1,0],[0,1,1,0,1,1],[0,0,1,0,0,0],[1,1,0,1,1,0],[0,1,0,0,0,0]]))
//
//extension Array where Element == Int {
//    var left: [Int] { return [self[0], self[1] - 1] }
//    var right: [Int] { return [self[0], self[1] + 1] }
//    var down: [Int] { return [self[0] + 1, self[1]] }
//    var up: [Int] { return [self[0] - 1, self[1]] }
//}
//
//extension Set where Element == [Int] {
//    func rotate(_ maxColNum: Int) -> Self {
//        var rotated: Self = Set()
//        self.forEach { rotated.insert([$0[1], maxColNum - $0[0]]) }
//        return rotated
//    }
//}
