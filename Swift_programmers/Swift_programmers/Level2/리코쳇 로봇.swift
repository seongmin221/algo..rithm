//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/10/23.
//

import Foundation

//func possiblePoints(from f: (Int, Int), on board: [[String]], exclude points: [(Int, Int)]) -> [(Int, Int)] {
//    var result = [(Int, Int)]()
//    var i = 1
//    let x = f.0
//    let y = f.1
//    while true {
//        guard board[x][y - i] == "D", !points.contains(where: { $0 == (x, y - 1) }) else { i += 1; continue }
//        if y - i != 0 { result.append((x, y - i + 1)) }
//        break
//    }
//    i = 1
//    while true {
//        guard board[x][y + i] == "D", !points.contains(where: { $0 == (x, y + 1) }) else { i += 1; continue }
//        if y + i != board.first!.count - 1 { result.append((x, y + i - 1)) }
//        break
//    }
//    i = 1
//    while true {
//        guard board[x - i][y] == "D", !points.contains(where: { $0 == (x - 1, y) }) else { i += 1; continue }
//        if x - i != 0 { result.append((x - i + 1, y)) }
//        break
//    }
//    i = 1
//    while true {
//        guard board[x + i][y] == "D", !points.contains(where: { $0 == (x + 1, y) }) else { i += 1; continue }
//        if x + i != board.count - 1 { result.append((x + i - 1, y)) }
//        break
//    }
//    return result
//}

//func possiblePoints(from f: (Int, Int), on board: [[String]], exclude points: [(Int, Int)]) -> [(Int, Int)] {
//    var result = [(Int, Int)]()
//    var x = f.0
//    var y = f.1
//    for i in 0..<board.first!.count {
//        if points.contains(where: { $0 == (x, y - 1) }) { break }
//        guard board[x][y - i] == "D" else { continue }
//        if y - i != 0 {
//            result.append((f.0, f.1 - i + 1))
//        }
//        break
//    }
//    for i in 0..<board.first!.count {
//        if points.contains(where: { $0 == (x, y + 1) }) { break }
//        guard board[x][y + i] == "D" else { continue }
//        if y + i != board.first!.count - 1 { result.append((x, y + i - 1)) }
//        break
//    }
//    for i in 0..<board.count {
//        if points.contains(where: { $0 == (x - 1, y) }) { break }
//        guard board[x - i][y] == "D" else { continue }
//        if x - i != 0 { result.append((x - i + 1, y)) }
//        break
//    }
//    for i in 0..<board.count {
//        if points.contains(where: { $0 == (x + 1, y) }) { break }
//        guard board[x + i][y] == "D" else { continue }
//        if x + i != board.count - 1 {
//            result.append((x + i - 1, y))
//        }
//        break
//    }
//    return result
//}
//
//func solution(_ board:[String]) -> Int {
//    
//    var newBoard = board.map { $0.map { String($0) } }
//    newBoard.append(.init(repeating: "D", count: newBoard.first!.count))
//    newBoard.insert(.init(repeating: "D", count: newBoard.first!.count), at: 0)
//    for i in 0..<newBoard.count {
//        newBoard[i].insert("D", at: newBoard[i].count)
//        newBoard[i].insert("D", at: 0)
//    }
//    
//    var s = (0, 0)
//    var e = (0, 0)
//    for i in 1..<newBoard.count-1 {
//        if let start = newBoard[i].firstIndex(of: "R") { s = (i, start) }
//        if let end = newBoard[i].firstIndex(of: "G") { e = (i, end) }
//    }
//    
//    if newBoard[e.0][e.1 - 1] == "D" &&
//        newBoard[e.0][e.1 + 1] == "D" &&
//        newBoard[e.0 - 1][e.1] == "D" &&
//        newBoard[e.0 + 1][e.1] == "D" {
//        return -1
//    }
//    
//    var visited = [(Int, Int)]()
//    var needVisit = [s]
//    var count = [0]
//    var endCount = [Int]()
//    while !needVisit.isEmpty {
//        let pos = needVisit.removeFirst()
//        let c = count.removeFirst()
//        if newBoard[pos.0][pos.1] == "G" {
//            endCount.append(c)
//            continue
//        }
//        let newPoints = possiblePoints(from: pos, on: newBoard, exclude: visited)
//            .filter { point in !visited.contains(where: { $0 == point }) }
//        visited.append(pos)
//        needVisit += newPoints
//        count += .init(repeating: c + 1, count: newPoints.count)
//    }
//    
//    if endCount.isEmpty { return -1 }
//    
//    return endCount.min()!
//}

func leftMove(from start: (r: Int, c: String.Index), on board: [String]) -> (Int, String.Index) {
    var pos = start.c
    while true {
        if board[start.r][pos] == "D" { break }
        pos = board[start.r].index(pos, offsetBy: -1)
    }
    pos = board[start.r].index(pos, offsetBy: 1)
    return (start.r, pos)
}

func rightMove(from start: (r: Int, c: String.Index), on board: [String]) -> (Int, String.Index) {
    var pos = start.c
    while true {
        if board[start.r][pos] == "D" { break }
        pos = board[start.r].index(pos, offsetBy: 1)
    }
    pos = board[start.r].index(pos, offsetBy: -1)
    return (start.r, pos)
}

func upMove(from start: (r: Int, c: String.Index), on board: [String]) -> (Int, String.Index) {
    var pos = start.r
    while true {
        if board[pos][start.c] == "D" { break }
        pos -= 1
    }
    return (pos+1, start.c)
}

func downMove(from start: (r: Int, c: String.Index), on board: [String]) -> (Int, String.Index) {
    var pos = start.r
    while true {
        if board[pos][start.c] == "D" { break }
        pos += 1
    }
    return (pos-1, start.c)
}

@discardableResult
func possibleMoves(from start: (Int, String.Index), board: [String]) -> [(Int, String.Index)] {
    return [
        leftMove(from: start, on: board),
        upMove(from: start, on: board),
        rightMove(from: start, on: board),
        downMove(from: start, on: board)
    ]
}

func solution(_ board: [String]) -> Int {
    
    let boardWidth = board.first!.count
    let boardHeight = board.count
    
    var wholeBoard: [String] = .init(repeating: String(repeating: "D", count: boardWidth + 2), count: boardHeight + 2)
    board.enumerated().forEach { i, row in
        wholeBoard[i+1].replaceSubrange(" ".index("".startIndex, offsetBy: 1)...board.first!.endIndex, with: row)
    }
    wholeBoard.forEach { print($0) }
    
    var s: (Int, String.Index) = (0, "".startIndex)
    var e: (Int, String.Index) = (0, "".startIndex)
    for i in 1..<wholeBoard.count {
        if let rPos = wholeBoard[i].firstIndex(of: "R") { s = (i, rPos) }
        if let gPos = wholeBoard[i].firstIndex(of: "G") { e = (i, gPos) }
    }
    
    var needVisit: [(Int, String.Index)] = [s]
    var count: [Int] = [0]
    var visited: [(Int, String.Index)] = []
    
    var p: (Int, String.Index) = (0, "".startIndex)
    var c = 0
    
    while !needVisit.isEmpty {
        p = needVisit.removeFirst()
        c = count.removeFirst()
        
        if p == e { break }
        if visited.contains(p) { continue }
        visited.append(p)
        
        possibleMoves(from: p, board: wholeBoard)
            .filter { !visited.contains($0) }
            .forEach { needVisit.append($0); count.append(c+1) }
    }
    
    return c
}

extension Array where Element == (Int, String.Index) {
    func contains(_ elem: Element) -> Bool {
        self.contains(where: { $0.0 == elem.0 && $0.1 == elem.1})
    }
}
