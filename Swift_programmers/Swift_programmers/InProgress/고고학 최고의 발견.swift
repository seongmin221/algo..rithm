//
//  고고학 최고의 발견.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/5/24.
//

import Foundation

//func solution(_ clockHands: [[Int]]) -> Int {
//
//    typealias Pos = (y: Int, x: Int)
//
//
//    let size = clockHands.count
//    var board: [[Int]] = clockHands
//
//    func surroundingPos(center: Pos) -> [Pos] {
//        var positions: [Pos] = []
//
//        if center.y != 0 { positions.append((center.y-1, center.x)) }
//        if center.y != size - 1 { positions.append((center.y+1, center.x)) }
//        if center.x != 0 { positions.append((center.y, center.x-1)) }
//        if center.x != size - 1 { positions.append((center.y, center.x+1)) }
//
//        return positions
//    }
//
//    func posIsNotZero(_ pos: Pos) -> Bool {
//        return board[pos.y][pos.x] != 0
//    }
//
//    var count = 0
//    for y in 0..<board.count {
//        for x in 0..<board.count {
//            let positions: [Pos] = [(y,x)] + surroundingPos(center: (y,x))
//            guard positions.allSatisfy(posIsNotZero) else { continue }
//            positions.forEach { pos in
//                board[pos.y][pos.x] += 1
//                board[pos.y][pos.x] %= size
//            }
//            count += 1
//        }
//    }
//
//    return count
//}



//func solution(_ clockHands: [[Int]]) -> Int {
//
//    let length = clockHands.count
//
//    func findAllCases() -> [[Int]] {
//        var cases: [[Int]] = []
//
//        func dfs(level: Int, turn: Int, state: [Int]) {
//            var state = state
//            state[level] = turn
//
//            if level == length - 1 {
//                cases.append(state)
//                return
//            }
//            for t in 0..<4 {
//                dfs(level: level+1, turn: t, state: state)
//            }
//        }
//        for t in 0..<4 { dfs(level: 0, turn: t, state: .init(repeating: 0, count: length)) }
//        return cases
//    }
//
//    func findSurroundingPos(center: (y: Int, x: Int)) -> [(y: Int, x: Int)] {
//        var positions: [(y: Int, x: Int)] = []
//
//        if center.y != 0 { positions.append((center.y-1, center.x)) }
//        if center.y != length - 1 { positions.append((center.y+1, center.x)) }
//        if center.x != 0 { positions.append((center.y, center.x-1)) }
//        if center.x != length - 1 { positions.append((center.y, center.x+1)) }
//
//        return positions
//    }
//
//    func evaluateCase(_ row: [Int]) -> Int? {
//        var board = clockHands
//        for (i, val) in row.enumerated() {
//            board[0][i] += val
//            board[0][i] %= 4
//        }
//
//        var rotationCount = 0
//        for y in 1..<length {
//            for x in 0..<length {
//                let rotationNeeded = (4 - board[y-1][x]) % 4
//                let willTurnPos = [(y, x)] + findSurroundingPos(center: (y, x))
//                for pos in willTurnPos {
//                    board[pos.y][pos.x] += rotationNeeded
//                    board[pos.y][pos.x] %= 4
//                }
//                rotationCount += rotationNeeded
//            }
//        }
//
//        for y in 0..<length {
//            for x in 0..<length {
//                guard board[y][x] == 0 else { return nil }
//            }
//        }
//        return rotationCount
//    }
//
//    var minRotation: Int = 65536
//    for row in findAllCases() {
//        guard let count = evaluateCase(row) else { continue }
//        minRotation = min(minRotation, count)
//    }
//
//    return minRotation
//}


func solution(_ clockHands: [[Int]]) -> Int {
    
    let size = clockHands.count
    
    func findSurroundingPos(center: (y: Int, x: Int)) -> [(y: Int, x: Int)] {
        var positions: [(y: Int, x: Int)] = [(center.y, center.x)]
        if center.y > 0 { positions.append((center.y-1, center.x)) }
        if center.y < size - 1 { positions.append((center.y+1, center.x)) }
        if center.x > 0 { positions.append((center.y, center.x-1)) }
        if center.x < size - 1 { positions.append((center.y, center.x+1)) }
        
        return positions
    }
    
    func evaluateCase(row: [Int]) -> Int? {
        var board = clockHands
        for (i, val) in row.enumerated() {
            board[0][i] = (val + board[0][i]) % 4
        }
        
        var totalRotations: Int = 0
        for y in 1..<size {
            for x in 0..<size {
                let rotationCount = (4 - board[y-1][x]) % 4
                let pos = findSurroundingPos(center: (y, x))
                
                for p in pos {
                    board[p.y][p.x] = (board[p.y][p.x] + rotationCount) % 4
                }
                totalRotations += rotationCount
            }
        }
        
        if board.last!.allSatisfy({ $0 == 0 }) { return totalRotations }
        else { return nil }
    }
    
    var result: Int? = nil
    func dfs(col: Int, turn: Int, rowState: [Int]) {
        if result != nil { return }
        
        if col == size {
            if let value = evaluateCase(row: rowState) { result = value }
            return
        }
        
        var newRow = rowState
        newRow[col] = turn
        
        for turn in 0..<4 {
            dfs(col: col+1, turn: turn, rowState: newRow)
        }
    }
    
    for turn in 0..<4 {
        dfs(col: 0, turn: turn, rowState: .init(repeating: 0, count: size))
    }
    
    return result!
}

//print(solution([[0,3,3,0],[3,2,2,3],[0,3,2,0],[0,3,3,3]]))
