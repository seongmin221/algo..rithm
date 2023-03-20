//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/18.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
    var cnt = 0
    let n = board.count
    var fullBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: n+2), count: n+2)
    for row in 0..<n {
        for col in 0..<n {
            if board[row][col] == 1{
                fullBoard[row].replaceSubrange(col..<col+3, with: [1, 1, 1])
                fullBoard[row+1].replaceSubrange(col..<col+3, with: [1, 1, 1])
                fullBoard[row+2].replaceSubrange(col..<col+3, with: [1, 1, 1])
            }
        }
    }
    fullBoard.removeFirst()
    fullBoard.removeLast()
    for row in 0..<n {
        fullBoard[row].removeFirst()
        fullBoard[row].removeLast()
        for col in 0..<n {
            if fullBoard[row][col] == 0 {
                cnt += 1
            }
        }
    }
    return cnt
}
