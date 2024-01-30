//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/27/24.
//

import Foundation

//    skill의 각 행은 [type, r1, c1, r2, c2, degree]형태를 가지고 있습니다.
//    type은 1 혹은 2입니다.
//    type이 1일 경우는 적의 공격을 의미합니다. 건물의 내구도를 낮춥니다.
//    type이 2일 경우는 아군의 회복 스킬을 의미합니다. 건물의 내구도를 높입니다.
//    건물은 파괴되었다가 회복 스킬을 받아 내구도가 1이상이 되면 파괴되지 않은 상태가 됩니다.


// MARK: - 1차 시도: 정확성 통과 / 효율성 실패

//func solution(_ board: [[Int]], _ skill: [[Int]]) -> Int {
//    
//    var board = board
//    let rowCount = board.count
//    let colCount = board.first!.count
//    
//    for s in skill {
//        for row in s[1]...s[3] {
//            for col in s[2]...s[4] {
//                board[row][col] += s[5] * (s[0] == 1 ? -1 : 1)
//            }
//        }
//    }
//    
//    var result = 0
//    for r in board {
//        result += r.filter { $0 > 0 }.count
//    }
//    
//    return result
//}



// MARK: - 답 봄 ㅎ: 누적합

func solution(_ board: [[Int]], _ skill: [[Int]]) -> Int {
    
    var board = board
    let rowCount = board.count
    let colCount = board.first!.count
    
    var skillBoard: [[Int]] = .init(repeating: .init(repeating: 0, count: colCount + 1), count: rowCount + 1)
    
    for s in skill {
        let sign = s[0] == 1 ? -1 : 1
        skillBoard[s[1]][s[2]] += s[5] * sign
        skillBoard[s[3]+1][s[4]+1] += s[5] * sign
        
        skillBoard[s[3]+1][s[2]] -= s[5] * sign
        skillBoard[s[1]][s[4]+1] -= s[5] * sign
    }
    
    for y in 0..<rowCount {
        for x in 0..<colCount {
            skillBoard[y][x+1] += skillBoard[y][x]
        }
    }
    
    for y in 0..<rowCount {
        for x in 0..<colCount {
            skillBoard[y+1][x] += skillBoard[y][x]
        }
    }
    
    for y in 0..<rowCount {
        for x in 0..<colCount {
            board[y][x] += skillBoard[y][x]
        }
    }
    
    var result = 0
    for row in board {
        result += row.filter { $0 > 0 }.count
    }
    
    return result
}


//print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]], [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]))
//print(solution([[1,2,3],[4,5,6],[7,8,9]], [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]]))
