//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/29.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var newBoard = board
    var basket: [Int] = []
    var result = 0
    
    let rows = board.count
    for move in moves {
        let basketCount: Int
        for row in 0..<rows {
            if newBoard[row][move-1] == 0 {
                continue
            } else {
                basket.append(newBoard[row][move-1])
                newBoard[row][move-1] = 0
                break
            }
        }
        basketCount = basket.count
        if basketCount < 2 {
            continue
        }
        if basket[basketCount - 1] == basket[basketCount - 2] {
            result += 2
            basket.popLast()
            basket.popLast()
        }
    }
    
    return result
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))

//board    moves    result
//[[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]    [1,5,3,5,1,2,1,4]    4

//var board = [
//    [0,0,0,0,0],
//    [0,0,1,0,3],
//    [0,2,5,0,1],
//    [4,2,4,4,2],
//    [3,5,1,3,1]
//]
